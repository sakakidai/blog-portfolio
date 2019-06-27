FactoryBot.define do
  factory :blog do
    title "テストブログ"
    body "テストブログのボディーです。"
    association :user
  end

  factory :blogs_without_user, class: Blog do
    title "ユーザーがいないブログ"
    body "ユーザーがいないブログのボディーです。"
  end
end
