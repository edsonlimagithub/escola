class Aluno < ActiveRecord::Base
  attr_accessible :bairro, :cidade, :data_nascimento, :data_vencimento, :fone, :fone2, :logradouro, :logradouro_complemento, 
    :logradouro_numero, :matricula, :nome, :observacao, :sexo, :tipo_sanguineo, :uf, :dia_vencimento
  
  validates  :empresa_id, :presence => true
  belongs_to :empresas
  has_many   :mensalidades 
end
