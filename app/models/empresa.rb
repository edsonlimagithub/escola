class Empresa < ActiveRecord::Base
  attr_accessible :descricao
  has_many :users
  has_many :alunos
  has_many :mensalidades
end
