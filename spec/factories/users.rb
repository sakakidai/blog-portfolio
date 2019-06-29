FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_name#{n}" }
    sequence(:email) { |n| "test#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :other_user, class: User do
    sequence(:name) { |n| "test_name_other#{n}"}
    sequence(:email) { |n| "test_other#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

end
