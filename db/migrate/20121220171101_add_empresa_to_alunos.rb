class AddEmpresaToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :empresa, :integer
  end
end
