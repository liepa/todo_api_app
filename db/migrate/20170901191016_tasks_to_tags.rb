class TasksToTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_tasks do |t|
      t.references :task, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
