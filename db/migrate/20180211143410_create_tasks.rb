class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :project, index: true, foreign_key: true
      t.string :description
      t.integer :status, default: 0
      t.datetime :due_at

      t.timestamps
    end
  end
end
