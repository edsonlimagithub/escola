class Turma < ActiveRecord::Base
  attr_accessible :descricao, :dt_fim, :dt_inicio, :limite_alunos
end
