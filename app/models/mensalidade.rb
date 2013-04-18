class Mensalidade < ActiveRecord::Base

  attr_accessible :aluno_id, :vencimento, :valor, :empresa_id

  belongs_to :aluno
  belongs_to :empresas
  
  validates :empresa_id, :presence => true
  
  def diasAtraso
    (self.vencimento - DateTime.now.to_date).round
  end
  
end
