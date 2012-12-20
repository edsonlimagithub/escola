class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.integer :matricula
      t.string :nome
      t.date :data_nascimento
      t.string :logradouro
      t.string :logradouro_numero
      t.string :logradouro_complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :tipo_sanguineo
      t.date :data_vencimento
      t.string :sexo
      t.string :fone
      t.string :fone2
      t.text :observacao

      t.timestamps
    end
  end
end
