require 'rails_helper'

# apiを返すのでタイプはリクエストになる
RSpec.describe TodoItem, type: :request do
    describe '一覧取得' do
        it 'GET  /v1/todo_items' do
            # 10この情報を作成(listをつける)
            FactoryBot.create_list(:todo_item, 10)
            # 欲しいURLを記述
            get '/v1/todo_items'
            # json形式で
            json = JSON.parse(response.body)

            # リクエスト成功を表す200が返ってきたか確認する。
            expect(response.status).to eq(200)

            # 正しい数のデータが返されたか確認する。
            expect(json.length).to eq(10)
        end
    end

    describe '詳細' do
        it 'GET v1/todo_items/:id' do
            # 詳細情報を作成
            todo_item = create(:todo_item, text: 'test')
            # こういうときには""(ダブル)を使用する
            get "/v1/todo_items/#{todo_item.id}"
            json = JSON.parse(response.body)

            expect(response.status).to eq(200)

            expect(json["text"]).to eq(todo_item.text)
        end
    end

    describe '更新' do
        it 'PUT /v1/todo_items/:id' do
            todo_item = create(:todo_item, text: 'old-text')

            put "/v1/todo_items/#{todo_item.id}", params: { todo_item: {text: 'new-text'}  }
            json = JSON.parse(response.body)

            # リクエスト成功を表す200が返ってきたか確認する。
            expect(response.status).to eq(200)

            #データが更新されている事を確認
            expect(json["text"]).to eq('new-text')
        end
    end

    describe '作成' do
        it 'POST /v1/todo_items' do
            # textの中身を指定
            valid_params = { text: 'test'}

            # 動作確認
            expect {post '/v1/todo_items', params: { post: valid_params } }.to change(TodoItem, :count).by(+1)

            # リクエスト成功を表す200が返ってきたか確認する。
            expect(response.status).to eq(200)
        end
    end

    describe '削除' do
        it 'DELETE /v1/todo_items/:id' do

            # 雛形を作成
            todo_item = create(:todo_item)

            # 動作確認
            expect {delete "/v1/todo_items/#{todo_item.id}"}.to change(TodoItem, :count).by(-1)

            # リクエストの確認
            expect(response.status).to eq(200)
        end
    end
end