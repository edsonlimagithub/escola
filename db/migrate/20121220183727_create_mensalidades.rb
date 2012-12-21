class CreateMensalidades < ActiveRecord::Migration
  def change
    create_table :mensalidades do |t|
      t.integer :aluno_id
      t.date :vencimento
      t.float :valor
      t.float :desconto
      t.float :multa
      t.float :juros
      t.date :data_quitacao
      t.timestamps
    end
  end
end
