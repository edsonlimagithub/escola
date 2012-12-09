class AddColumnEmpresaToUser < ActiveRecord::Migration
  def change
    add_column :users, :empresa_id, :integer
  end
end
