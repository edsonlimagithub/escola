class Empresa < ActiveRecord::Base
  attr_accessible :descricao
  has_many :users
end
