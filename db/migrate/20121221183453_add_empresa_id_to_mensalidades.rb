class AddEmpresaIdToMensalidades < ActiveRecord::Migration
  def change
    add_column :mensalidades, :empresa_id, :integer
  end
end
