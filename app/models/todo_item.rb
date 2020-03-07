class TodoItem < ApplicationRecord
    has_many :todo_comments, dependent: :destroy

    validates :text, presence: true
end
