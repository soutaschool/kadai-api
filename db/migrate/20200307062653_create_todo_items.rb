class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.string :text, null: false

      t.timestamps
    end
    add_index :todo_items, :text
  end
end
