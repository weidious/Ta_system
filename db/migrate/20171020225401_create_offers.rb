class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :app_type
      t.boolean :student_accepted
      t.boolean :instructor_accepted
      t.timestamp :created_at

      t.timestamps
    end
  end
end
