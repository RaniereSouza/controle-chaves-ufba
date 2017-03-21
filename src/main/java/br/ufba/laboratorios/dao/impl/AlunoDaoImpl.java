package br.ufba.laboratorios.dao.impl;

import br.ufba.laboratorios.dao.AlunoDao;
import br.ufba.laboratorios.entity.Aluno;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Bruno on 21/03/2017.
 */
public class AlunoDaoImpl implements AlunoDao {
    private Connection connection;

    @Override
    public void inserir(Aluno aluno) {
        String sql = "INSERT INTO `chaves`.`aluno` (`nome`, `matricula`, `email`) VALUES (?, ?, ?);";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setString(3, aluno.getEmail());

            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("ERRO ao inserir: " + e.getLocalizedMessage());
        }
    }

    public void atualizar(Aluno aluno) {
        String sql = "UPDATE `chaves`.`aluno` SET  `nome` = ?, `matricula` = ?, `email` = ? WHERE idAluno = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setString(3, aluno.getEmail());
            stmt.setInt(4, aluno.getId());

            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("ERRO ao atualizar: " + e.getLocalizedMessage());
        }
    }

    public void deletar(int idAluno) {
        String sql = "DELETE FROM `chaves`.`aluno` WHERE idAluno = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, idAluno);

            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("ERRO ao deletar: " + e.getLocalizedMessage());
        }
    }

    public List<Aluno> obterTodos() {
        String sql = "SELECT * FROM `chaves`.`aluno`";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet results = stmt.executeQuery();

            List<Aluno> listaAlunos = new ArrayList<Aluno>();

            while(results.next()){
                Aluno aluno = new Aluno();

                aluno.setId(results.getInt("idAluno"));
                aluno.setNome(results.getString("nome"));
                aluno.setMatricula(results.getString("matricula"));
                aluno.setEmail(results.getString("email"));

                listaAlunos.add(aluno);
            }

            results.close();
            stmt.close();

            return listaAlunos;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Aluno obterPorId(int idAluno) {
        String sql = "SELECT * FROM `chaves`.`aluno` WHERE idAluno = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, idAluno);

            ResultSet results = stmt.executeQuery();

            Aluno aluno = new Aluno();

            aluno.setId(results.getInt("idAluno"));
            aluno.setNome(results.getString("nome"));
            aluno.setMatricula(results.getString("matricula"));
            aluno.setEmail(results.getString("email"));

            results.close();
            stmt.close();

            return aluno;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
