module V1
    module Entities
        class TodoItemEntity < Grape::Entity
            expose :id
            expose :text
            # expose :todo_comment, using: V1::Entities::TodoCommentEntity
            # ここでは使わないものは記述しない
        end
    end
end