module V1
    module Entities
        class TodoCommentEntity < Grape::Entity
            expose :id
            expose :text
            expose :todo_item, using: V1::Entities::TodoItemEntity
            # ここで記述したものがcreateの:~となる
        end
    end
end