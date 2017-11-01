class ChangeColumnsForStudents < ActiveRecord::Migration[5.1]
  def self.up
    change_column :students, :level, 'integer USING level::integer'
    change_column :students, :assigned, 'boolean USING assigned::boolean'
    change_column :students, :can_ta, 'boolean USING can_ta::boolean'
    change_column :students, :can_grader, 'boolean USING can_grader::boolean'
    change_column :students, :can_sgrader, 'boolean USING can_sgrader::boolean'
    change_column :students, :date_enrolled, 'date USING date_enrolled::date'
  end

  def self.down
    change_column :students, :date_enrolled, :string
    change_column :students, :can_sgrader, :string
    change_column :students, :can_grader, :string
    change_column :students, :can_ta, :string
    change_column :students, :assigned, :string
    change_column :students, :level, :string
  end
end
