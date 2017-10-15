class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :uin
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :level
      t.string :integer
      t.string :email
      t.string :phone
      t.string :string
      t.string :assigned
      t.string :boolean
      t.string :advisor_email
      t.string :string
      t.string :can_ta
      t.string :boolean
      t.string :can_grader
      t.string :boolean
      t.string :can_sgrader
      t.string :boolean
      t.string :perferences
      t.string :string
      t.string :date_enrolled
      t.string :date
      t.string :last_modified
      t.string :timestamp

      t.timestamps
    end
  end
end
