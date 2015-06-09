class AddTeacherRefToParents < ActiveRecord::Migration
  def change
    add_reference :parents, :teacher, index: true, foreign_key: true
  end
end
