class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :subject
      t.integer :num
      t.integer :section
      t.string :title
      t.integer :id_primary_inst
      t.integer :num_ta
      t.integer :num_grader
      t.integer :num_sgrader
      t.text :requirement_ta
      t.text :requirement_grader
      t.text :requirement_sgrader
      t.integer :ta_candidate_1
      t.integer :ta_candidate_2
      t.integer :ta_candidate_3
      t.integer :ta_candidate_4
      t.integer :ta_candidate_5
      t.integer :grader_candidate_1
      t.integer :grader_candidate_2
      t.integer :grader_candidate_3
      t.integer :grader_candidate_4
      t.integer :grader_candidate_5
      t.integer :sgrader_candidate_1
      t.integer :sgrader_candidate_2
      t.integer :sgrader_candidate_3
      t.integer :sgrader_candidate_4
      t.integer :sgrader_candidate_5

      t.timestamps
    end
  end
end
