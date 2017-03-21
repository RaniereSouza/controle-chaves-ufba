package br.ufba.laboratorios.dao;

import br.ufba.laboratorios.entity.Aluno;

import java.util.List;

/**
 * Created by Bruno on 21/03/2017.
 */
public interface AlunoDao {
    void inserir(Aluno aluno);
    void atualizar(Aluno aluno);
    void deletar(int idAluno);
    Aluno obterPorId(int idAluno);
    List<Aluno> obterTodos();
}
