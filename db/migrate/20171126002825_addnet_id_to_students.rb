class AddnetIdToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :netID, :string
    add_column :instructors, :netID, :string
  end
end
