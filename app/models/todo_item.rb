class TodoItem < ApplicationRecord
    has_many :todo_comments, dependent: :destroy
    # todo_item.todo_comments.で見れるようになる

    validates :text, presence: true
end
