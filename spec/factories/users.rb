FactoryBot.define do
  factory :user do
    name "sakaki"
    email "sakaki1@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :other_user, class: User do
    name "satou"
    email "satou@gmail.com"
    password "password"
    password_confirmation "password"
  end

end
