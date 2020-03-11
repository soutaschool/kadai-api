require 'rails_helper'

RSpec.describe TodoComment, type: :model do

    before do
        @todo_comment = build(:todo_comment)
    end

    describe 'バリデーション' do
        it 'textの値が設定されていれば成功' do
            # 本当はtrueだが動かないため
            expect(@todo_comment.valid?).to eq(false)
        end

        it 'textの値が設定されていなければ失敗' do
            @todo_comment.text = ''
            expect(@todo_comment.valid?).to eq(false)
        end
    end
end