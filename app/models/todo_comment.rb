class TodoComment < ApplicationRecord
    belongs_to :todo_item, optional: true

    validates  :text, presence: true
end
