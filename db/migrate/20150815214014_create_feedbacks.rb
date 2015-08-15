class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer  :assignment_id
      t.string   :sender
      t.string   :receiver
      t.text     :content

      t.timestamps null: false
    end
  end
end
