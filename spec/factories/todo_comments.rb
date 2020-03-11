FactoryBot.define do
  factory :todo_comment do
    sequence(:text) { |t| "TEST_TEXT#{t}"}
  end
end