class CreateTodoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_comments do |t|
      t.string :text, null: false
      t.references :todo_item, foreign_key: true

      t.timestamps
    end
    add_index :todo_comments, [ :todo_item_id, :text ]
  end
end
