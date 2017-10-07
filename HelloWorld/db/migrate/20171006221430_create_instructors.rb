class CreateInstructors < ActiveRecord::Migration[5.1]
  def change
    create_table :instructors do |t|
      t.integer :uin
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
