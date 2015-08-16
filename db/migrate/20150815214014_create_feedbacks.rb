class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer  :assignment_id
      t.integer  :sender_id
      t.integer  :receiver_id
      t.text     :content

      t.timestamps null: false
    end
  end
end
