package com.quiizapp.quiz.dao;



import org.springframework.data.jpa.repository.JpaRepository;


import com.quiizapp.quiz.model.Quiz;

public interface QuizDao extends JpaRepository<Quiz,Integer> {

}


