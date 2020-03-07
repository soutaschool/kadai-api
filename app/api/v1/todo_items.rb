module V1
    class TodoItems < Grape::API
        resources :todo_items do

            # 動作確認
            desc '一覧'
            get '/' do
                @todo_items = TodoItem.all
            end

            desc 'IDの取得'
            params do
                requires :id, type: Integer
            end
            get '/:id' do
                @todo_item = TodoItem.find(params[:id])
            end

            # 用件
            desc '作成'
            params do
                requires :text, type: String
            end
            post '/' do
                @todo_item = TodoItem.create(text: params[:text])
            end

            desc '削除'
            params do
                requires :id, type: Integer
            end
            delete '/:id' do
                @todo_item = TodoItem.find(params[:id])
                @todo_item.destroy
            end

            desc '編集'
            params do
                requires :id, type: Integer
                requires :text, type: String
            end
            patch '/:id' do
                @todo_item = TodoItem.find(params[:id])
                @todo_item.update(text: params[:text])
            end
        end
    end
end