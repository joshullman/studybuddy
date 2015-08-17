class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer  :classroom_id
      t.string   :name
      t.text     :content

      t.timestamps null: false
    end
  end
end
