FactoryGirl.define do
  factory :song_history do
    sequence(:proto_name) { |n| "SH-#{n}" }
  end
end
