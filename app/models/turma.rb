class Turma < ActiveRecord::Base
  
  attr_accessible :descricao, :dt_fim, :dt_inicio, :limite_alunos, :empresa_id
  
  validates :empresa_id, :presence => true
  
  belongs_to :empresas
  has_many :alunos
  
end
