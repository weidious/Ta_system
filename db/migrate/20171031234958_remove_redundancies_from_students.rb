class RemoveRedundanciesFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :integer, :string
    remove_column :students, :string, :string
    remove_column :students, :boolean, :string
    remove_column :students, :date, :string
    remove_column :students, :last_modified, :string
    remove_column :students, :timestamp, :string
  end
end
