class RenameEmpresaInAlunosToEmpresaId < ActiveRecord::Migration
  def up
     rename_column :alunos, :empresa, :empresa_id 
    
  end

  def down
    rename_column :alunos, :empresa_id, :empresa
  end
end
