module V1
    module Entities
        class TodoItemEntity < Grape::Entity
            expose :id
            expose :text
        end
    end
end