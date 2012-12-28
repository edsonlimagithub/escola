class AddEmpresaIdToTurmas < ActiveRecord::Migration
  def change
    add_column :turmas, :empresa_id, :integer
  end
end
