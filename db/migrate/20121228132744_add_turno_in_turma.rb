class AddTurnoInTurma < ActiveRecord::Migration
  def up
    add_column :turmas, :turno, :string
  end

  def down
    remove_column :turmas, :turno
  end
end
