class Mensalidade < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :alunos
end
