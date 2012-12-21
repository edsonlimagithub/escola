class Mensalidade < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :alunos
  belongs_to :empresas
end
