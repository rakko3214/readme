FactoryBot.define do
  factory :menu do
    sequence(:title, "title_1")
    association :user
  end
end
