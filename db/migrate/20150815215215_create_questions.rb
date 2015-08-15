class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer  :assignment_id
      t.text     :content
      t.text     :answer

      t.timestamps null: false
    end
  end
end
