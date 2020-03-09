module V1
    class TodoComments < Grape::API
        resources :todo_comments do
            # present @instance, with: EntityName

            # 動作確認
            desc '一覧'
            get '/' do
                todo_comments = TodoComment.all

                # しっかり渡すことができているかどうかの確認
                if  todo_comments.present?
                    present todo_comments, with: V1::Entities::TodoCommentEntity
                else
                    status 404
                    present todo_comments.errors.full_messages
                end
            end

            desc '詳細'
            params do
                requires :id, type: Integer
            end
            get '/:id' do
                todo_comment = TodoComment.find(params[:id])

                if todo_comment.present?
                    present todo_comment, with: V1::Entities::TodoCommentEntity
                else
                    status 404
                    present todo_comment.errors.full_messages
                end
            end

            # 用件
            desc '作成'
            params do
                requires :text, type: String
                requires :todo_item_id, type: Integer
            end
            post '/' do
                todo_comment = TodoComment.new(
                    text: params[:text],
                    todo_item_id: params[:todo_item_id]
                    )

                if  todo_comment.save
                    status 201
                    present todo_comment, with: V1::Entities::TodoCommentEntity
                else
                    status 400
                    present todo_comment.errors.full_messages
                end
            end

            desc '削除'
            params do
                requires :id, type: Integer
            end
            delete '/:id' do
                todo_comment = TodoComment.find(params[:id])
                
                if  todo_comment.destroy
                    status 202
                    present nil
                else
                    stauts 400
                    present todo_comment.errors.full_messages
                end
            end

            desc '編集'
            params do
                requires :id, type: Integer
                requires :text, type: String
            end
            patch '/:id' do
                todo_comment = TodoComment.find(params[:id])

                if todo_comment.update(text: params[:text])
                    status 203
                    present todo_comment, with: V1::Entities::TodoCommentEntity
                else
                    status 400
                    present todo_comment.errors.full_messages
                end
            end
        end
    end
end