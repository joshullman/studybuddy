class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer  :teacher_id
      t.string   :name
      t.text     :description

      t.timestamps null: false
    end
  end
end
