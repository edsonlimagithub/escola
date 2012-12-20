class AddDiaVencimentoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :dia_vencimento, :integer
  end
end
