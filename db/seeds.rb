# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
roleAdministrador = Role.new(:name => 'administrador')
roleAdministrador.save
roleOperador = Role.new(:name => 'operador')
roleOperador.save
roleUsuario = Role.new(:name => 'usuario')
roleUsuario.save

empresaPadrao = Empresa.new(:descricao => 'padrao')
empresaPadrao.save

user = User.new({:username =>  'edsonlima', :email => 'edson-lima@outlook.com', 
	:password => '217845', :empresa_id => empresaPadrao.id})
user.save

