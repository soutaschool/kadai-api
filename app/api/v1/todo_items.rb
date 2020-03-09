module V1
    class TodoItems < Grape::API
        resources :todo_items do

            # 動作確認
            desc '一覧'
            get '/' do
                todo_items = TodoItem.all

                # しっかり渡せているか？
                if  todo_items.present?
                    present todo_items, with: V1::Entities::TodoItemEntity
                else
                    status 404
                    todo_items.errors.full_messages
                end
            end

            desc '詳細'
            params do
                requires :id, type: Integer
            end
            get '/:id' do
                todo_item = TodoItem.find(params[:id])

                if  todo_item.present?
                    present todo_item, with: V1::Entities::TodoItemEntity
                else
                    status 404
                    todo_item.errors.full_messages
                end
            end

            # 用件
            desc '作成'
            params do
                requires :text, type: String
            end
            post '/' do
                todo_item = TodoItem.new(text: params[:text])

                if todo_item.save
                    status 201
                    present todo_item, with: V1::Entities::TodoItemEntity
                else
                    status 400
                    present todo_item.errors.full_messages
                end
            end

            desc '削除'
            params do
                requires :id, type: Integer
            end
            delete '/:id' do
                todo_item = TodoItem.find(params[:id])
                if todo_item.destroy
                    status 202
                    present nil
                else
                    status 400
                    present todo_item.errors.full_messages
                end
            end

            desc '編集'
            params do
                requires :id, type: Integer
                requires :text, type: String
            end
            patch '/:id' do
                todo_item = TodoItem.find(params[:id])

                if todo_item.update(text: params[:text])
                    status 203
                    present todo_item, with: V1::Entities::TodoItemEntity
                else
                    status 400
                    present todo_item.errors.full_messages
                end
            end

            desc '一括削除'
            # そもそもTodoItemを削除したら紐付けされているものを消すので
            params do
                requires :id, type: Integer
            end
            delete '/:id/todo_comments' do
                todo_item = TodoItem.find(params[:id])

                todo_comments = todo_item.todo_comments.all
                #  todo_commentsの全てを表示
                if todo_comments.destroy_all
                    # セベて削除
                    status 202
                    present nil
                else
                    status 400
                    present todo_item.errors.full_messages
                end
            end
        end
    end
end