package com.caseyjohnson.javaproject.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.caseyjohnson.javaproject.models.Workout;

@Repository
public interface WorkoutRepo extends CrudRepository<Workout, Long> {
	List<Workout> findAll();
}
