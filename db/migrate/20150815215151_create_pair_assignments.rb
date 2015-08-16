class CreatePairAssignments < ActiveRecord::Migration
  def change
    create_table :pair_assignments do |t|
      t.integer  :student_one_id
      t.integer  :student_two_id
      t.integer  :assignment_id
      t.text     :content
      t.boolean  :completed, default: false

      t.timestamps null: false
    end
  end
end
