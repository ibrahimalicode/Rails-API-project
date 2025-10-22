class CreateAssignments < ActiveRecord::Migration[8.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.date :due_date
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
