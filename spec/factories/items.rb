FactoryBot.define do
  factory :item do
    name               { Faker::Movies::StarWars.droid }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    introduction       { Faker::Movies::StarWars.wookiee_sentence }
    item_condition_id  { 2 }
    potage_payer_id    { 2 }
    prefecture_id      { 2 }
    preparation_day_id { 2 }
    category_id        { 2 }
    association :user
  end
end
