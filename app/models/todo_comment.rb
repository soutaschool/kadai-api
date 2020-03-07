class TodoComment < ApplicationRecord
    belongs_to :todo_item

    validates  :text, presence: true
end
