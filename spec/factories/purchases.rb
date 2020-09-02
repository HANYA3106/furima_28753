FactoryBot.define do
  factory :purchase do
    post_code     {'123-4567'}
    prefecture_id {2}
    city          {'東京都'}
    house_number  {'1-1'}
    phone_number  {'01234567890'}
    building_name {'東京ハイツ'}
    
  end
end