class Aluno < ActiveRecord::Base
  attr_accessible :bairro, :cidade, :data_nascimento, :data_vencimento, :fone, :fone2, :logradouro, :logradouro_complemento, 
    :logradouro_numero, :matricula, :nome, :observacao, :sexo, :tipo_sanguineo, :uf, :dia_vencimento
end
