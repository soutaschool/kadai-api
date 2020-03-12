require 'rails_helper'

RSpec.describe TodoComment, type: :request do
    describe '一覧の取得' do
        it 'GET /v1/todo_comments' do
            FactoryBot.create_list(:todo_comment, 10)
            get '/v1/todo_comments'
            json = JSON.parse(response.body)
            expect(response.status).to eq(200)
            expect(json.length).to eq(10)
        end
    end

    describe '詳細の取得' do
        it 'GET /v1/todo_comments/:id' do
            todo_comment = create(:todo_comment, text: 'test')
            get "/v1/todo_comments/#{todo_comment.id}"
            json = JSON.parse(response.body)
            expect(response.status).to eq(200)
            # [""]のなかにjsonのデーターを入れれば取り出せる
            expect(json["text"]).to eq(todo_comment.text)
        end
    end

    describe '更新' do
        it 'PUT /v1/todo_comments' do
            todo_comment = create(:todo_comment, text: 'old-text')

            put "/v1/todo_comments/#{todo_comment.id}", params: { todo_comment: {text: 'new-text'}  }
            json = JSON.parse(response.body)
            expect(response.status).to eq(200)
            expect(json).to eq('new-text')
        end
    end

    describe '削除' do
        it 'DELETE /v1/todo_comments/:id' do
            todo_comment = create(:todo_comment)
            expect {delete "/v1/todo_comments/#{todo_comment.id}"}.to change(TodoComment, :count).by(-1)
            expect(response.status).to eq(200)
        end
    end

    describe '追加' do
        it 'POST /v1/todo_comments' do
            todo_comment = create(:todo_comment)
            valid_params = { text: 'test' }
            expect { post '/v1/todo_comments', params: { post: valid_params } }.to change(TodoComment, :count).by(+1)
            expect(response.status).to eq(200)
        end
    end
end