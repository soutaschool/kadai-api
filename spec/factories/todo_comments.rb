FactoryBot.define do
  factory :todo_comment do
    sequence(:text) { |t| "TEST_TEXT#{t}"}
    sequence(:todo_item_id) { |t| "number#{t}" }
  end
end