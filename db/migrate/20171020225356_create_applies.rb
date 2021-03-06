class CreateApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :applies do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :appType
      t.integer :priority
      t.boolean :positive
      t.boolean :acceptAdjust
      t.boolean :takenBefore
      t.string :grade
      t.timestamp :createdAt

      t.timestamps
    end
  end
end
