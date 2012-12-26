class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :descricao
      t.date :dt_inicio
      t.date :dt_fim
      t.integer :limite_alunos

      t.timestamps
    end
  end
end
