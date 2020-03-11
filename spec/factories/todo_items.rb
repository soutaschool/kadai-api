# テストデータの定義をする
FactoryBot.define do
    # TodoItemモデルのテストデータtodo_itemを定義
    factory :todo_item do
        # 連番を持ったデータを生成する(sequence)
      sequence(:text) { |n| "TEST_TEXT#{n}"}
    end
  end