package com.caseyjohnson.javaproject.controllers;


import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.caseyjohnson.javaproject.models.FileUploadUtil;
import com.caseyjohnson.javaproject.models.LoginUser;
import com.caseyjohnson.javaproject.models.User;
import com.caseyjohnson.javaproject.models.Workout;
import com.caseyjohnson.javaproject.repo.WorkoutRepo;
import com.caseyjohnson.javaproject.services.UserService;
import com.caseyjohnson.javaproject.services.WorkoutService;




@Controller
public class HomeController {
	
	//Generate Autowired for services
	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkoutService workoutService;
	
	@Autowired
	private WorkoutRepo workoutRepo;
	
//	private List<String> categories = new ArrayList<String>();
//	categories.add("Chest");
	
	
	//----Dashboard-----
	
	@GetMapping("/")
	public String dashboard(Model model) {
		List<Workout> allWorkouts = workoutService.allWorkouts();
		model.addAttribute("workoutList", allWorkouts);
		return "dashboard.jsp";
	}
	
	//----Login-----
	
	@GetMapping("/login")
	public String login(
			@ModelAttribute("newUser") User newUser, 
			@ModelAttribute("newLogin") LoginUser newLogin
			) {
		return"login.jsp";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid
			@ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		User user= userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		session.setAttribute("firstName", user.getFirstName());
		return "redirect:/";
	}
	
	
	
	//----Register-----
	
	@GetMapping("/register")
	public String register(
			@ModelAttribute("newUser") User newUser, 
			@ModelAttribute("newLogin") LoginUser newLogin
			) {
		return"register.jsp";
	}
	
	@PostMapping("/register")
	public String newUser(
			@Valid
			@ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		userService.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		}
		session.setAttribute("userId", newUser.getId());
		session.setAttribute("firstName", newUser.getFirstName());
		return "redirect:/";
	}
	
	//-----logout-----
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//----Categories-----
	
	@GetMapping("/categories")
	public String categories(Model model) {
		List<Workout> allWorkouts = workoutService.allWorkouts();
		model.addAttribute("workoutList", allWorkouts);
		return"categories.jsp";
	}
	
	
	//---Create Workout----
	
	@GetMapping("/create/workout")
	public String createWorkoutPage(
			HttpSession session, 
			@ModelAttribute("workout")Workout workout
			) {
		if(session.getAttribute("userId") == null) {
			return"redirect:/";
		}
		return "createWorkout.jsp";
	}
	
	@PostMapping("/create/workout")
	public String createWorkout(
			@Valid
			@ModelAttribute("workout")Workout workout,
			@RequestParam("fileImage")MultipartFile multipartFile,
			BindingResult result
			)throws IOException {
		if(result.hasErrors()) {
			return"createWorkout.jsp";
		}
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		workout.setImage(fileName);
		Workout savedWorkout = workoutRepo.save(workout);
		String uploadDir = "./workout-images/" + savedWorkout.getId();
		FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
		return"redirect:/";
	}
	
	//---find all created by user
	@GetMapping("/{firstName}/workouts")
	public String userWorkouts(
			@PathVariable("firstName")String firstName,
			HttpSession session,
			Model model
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		List<Workout> allWorkouts = workoutService.allWorkouts();
		model.addAttribute("workoutList", allWorkouts);
		User user = userService.findUser((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "userWorkouts.jsp";
	}
	
	//---find all per category
	@GetMapping("/category/{category}/workouts")
	public String categoryWorkouts(
			@PathVariable("category") String category,
			Model model
			) {
		List<Workout> allWorkouts = workoutService.allWorkouts();
		model.addAttribute("workoutList", allWorkouts);
		model.addAttribute("category", category);
		return "categoryWorkouts.jsp";
	}
	
	//---workout Details
	@GetMapping("/workout/{id}")
	public String workoutDetails(
			@PathVariable("id")Long id, 
			HttpSession session, 
			Model model
			) {
		Workout foundWorkout = workoutService.oneWorkout(id);
		model.addAttribute("oneWorkout", foundWorkout);
		User user = userService.findUser((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "workoutDetails.jsp";
	}
	
	//----Edit workout
	@GetMapping("/workout/{id}/edit")
	public String editWorkoutPage(
			@PathVariable("id")Long id,
			HttpSession session,
			Model model
			) {
		if(session.getAttribute("userId") == null){
			return "redirect:/";
		}
		Workout workout = workoutService.oneWorkout(id);
		model.addAttribute("workout", workout);
		return "editWorkout.jsp";
	}
	
	@PutMapping("/workout/{id}/edit")
	public String editWorkout(
			@Valid
			@ModelAttribute("workout") Workout workout,
			BindingResult result,
			HttpSession session,
			@RequestParam("fileImage")MultipartFile multipartFile
			)throws IOException {
		if(session.getAttribute("userId")== null) {
			return"redirect:/";
		}
		if(result.hasErrors()) {
			return "editWorkout.jsp";
		} else {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			workout.setImage(fileName);
			Workout savedWorkout = workoutRepo.save(workout);
			String uploadDir = "./workout-images/" + savedWorkout.getId();
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			workoutService.updateWorkout(workout);
			return "redirect:/";
		}
	}
	
	//---Delete Workout----
	@DeleteMapping("/workout/{id}/delete")
	public String deleteWorkout(@PathVariable("id")Long id) {
		workoutService.deleteWorkout(id);
		return "redirect:/";
	}
	
}
