FactoryBot.define do
  factory :recipe do
    sequence(:title, "title_1")
    content { "content" }
    cooking_time { "6" }
    ingredient { "ingredient" }
    association :user
  end
end
