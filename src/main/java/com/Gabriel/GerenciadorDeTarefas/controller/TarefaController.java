package com.Gabriel.GerenciadorDeTarefas.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Gabriel.GerenciadorDeTarefas.model.Tarefas;
import com.Gabriel.GerenciadorDeTarefas.repository.TarefaRepository;

@RestController
@RequestMapping("/tarefas")
public class TarefaController {

    @Autowired
    private TarefaRepository tarefaRepository;

    @GetMapping
    public List<Tarefas> listarTarefas() {
        return tarefaRepository.findAll();
    }

    @PostMapping
    public ResponseEntity<Tarefas> adicionarTarefa(@RequestBody Tarefas tarefa) {
        Tarefas novaTarefa = tarefaRepository.save(tarefa);
        return ResponseEntity.ok(novaTarefa);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Tarefas> excluirTarefa(@PathVariable Long id) {
        if (tarefaRepository.existsById(id)) {
            tarefaRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Tarefas> atualizarTarefa(@PathVariable Long id, @RequestBody Tarefas tarefaAtualizada){
        Optional<Tarefas> tarefaExistente = tarefaRepository.findById(id);

        if(tarefaExistente.isPresent()){
            Tarefas tarefa = tarefaExistente.get();

            tarefa.setNome(tarefaAtualizada.getNome());
            tarefa.setDescricao(tarefaAtualizada.getDescricao());
            return ResponseEntity.ok(tarefaRepository.save(tarefa));
        }
        return ResponseEntity.notFound().build();
    }
}