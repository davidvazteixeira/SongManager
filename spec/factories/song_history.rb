FactoryGirl.define do
  factory :song_history do
    sequence(:proto_name) { |n| "SD-#{n}" }
  end
end
