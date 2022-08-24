package com.caseyjohnson.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caseyjohnson.javaproject.models.Workout;
import com.caseyjohnson.javaproject.repo.WorkoutRepo;

@Service
public class WorkoutService {
	
	@Autowired
	private WorkoutRepo workoutRepo;
	
	public List<Workout> allWorkouts(){
		return workoutRepo.findAll();
	}
	
	public Workout createWorkout(Workout workout) {
		return workoutRepo.save(workout);
	}
	
	public Workout oneWorkout(Long id) {
		Optional<Workout> optionalWorkout = workoutRepo.findById(id);
		if(optionalWorkout.isPresent()) {
			return optionalWorkout.get();
		} else {
			return null;
		}
	}
	
	public Workout updateWorkout(Workout workout) {
		return workoutRepo.save(workout);
	}
	
	public void deleteWorkout(Long id) {
		workoutRepo.deleteById(id);
	}
}
