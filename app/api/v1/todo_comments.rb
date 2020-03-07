module V1
    class TodoComments < Grape::API
        resources :todo_comments do

            # 動作確認
            desc '一覧'
            get '/' do
                @todo_comments = TodoComment.all
            end

            desc '詳細'
            params do
                requires :id, type: Integer
            end
            get '/:id' do
                @todo_comment = TodoComment.find(params[:id])
            end

            # 用件
            desc '作成'
            params do
                requires :text, type: String
            end
            post '/' do
                @todo_comment = TodoComment.create(text: params[:text])
            end

            desc '削除'
            params do
                requires :id, type: Integer
            end
            delete '/:id' do
                @todo_comment = TodoComment.find(params[:id])
                @todo_comment.destroy
            end

            desc '編集'
            params do
                requires :id, type: Integer
                requires :text, type: String
            end
            patch '/:id' do
                @todo_comment = TodoComment.find(params[:id])
                @todo_comment.update(text: params[:text])
            end
        end
    end
end