package com.caseyjohnson.javaproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name= "workouts")
public class Workout {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Long id;
	 
	 @NotNull(message= "Title must be provided")
	 @Size(min=1, message="Title must be provided")
	 private String title;
	 
	 @NotNull(message="Description must be provided")
	 @Size(min =1, message="Description must be provided")
	 private String description;
	 
	 @NotNull(message= "Workout must be provided")
	 @Size(min = 1, message="Workout must be provided")
	 private String exercise;
	 
	 @NotNull
	 @Size(min =1, message="Category must be provided")
	 private String category;
	 
	 @Column(length = 45, nullable =true)
	 private String image;
	 
	 
	 @Column(updatable=false)
	 @DateTimeFormat(pattern= "yyyy-MM-dd")
	 private Date createdAt;
	 @DateTimeFormat(pattern= "yyyy-MM-dd")
	 private Date updatedAt;
	 
	 //many-to-one
	 @ManyToOne(fetch= FetchType.LAZY)
	 @JoinColumn(name="user_id")
	 private User user;
	 
	 public Workout() {}

	 
	 
	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public String getExercise() {
		return exercise;
	}



	public void setExercise(String exercise) {
		this.exercise = exercise;
	}



	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	 
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    } 
	 
    @Transient
	 public String getWorkoutImagePath() {
		 if(image == null || id == null) return null;
		 return "/workout-images/" + id + "/" + image;
	 }
	 
}
