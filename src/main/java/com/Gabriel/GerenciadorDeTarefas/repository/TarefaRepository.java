package com.Gabriel.GerenciadorDeTarefas.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Gabriel.GerenciadorDeTarefas.model.Tarefas;

public interface TarefaRepository extends JpaRepository<Tarefas, Long> {

}
