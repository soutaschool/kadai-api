require 'rails_helper'

# TodoItemモデルのテストを宣言(スペルミスに注意)
RSpec.describe TodoItem, type: :model do
    # インスタンスを定義
    before do
        # TodoItemモデルのみを作成
        @todo_item = build(:todo_item)
    end

    describe 'バリデーション(validates)' do
        it 'textの値が設定されていれば成功' do
            # バリデーションができているか? できていれば成功
            expect(@todo_item.valid?).to eq(true)
        end

        it 'textの値が設定されていなければ失敗' do
            # 空白にしておく
            @todo_item.text = ''
            # この場合はfalse(失敗)をかえす
            expect(@todo_item.valid?).to eq(false)
        end
    end
end