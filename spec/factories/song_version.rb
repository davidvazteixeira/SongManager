FactoryGirl.define do
  factory :song_version do
    sequence(:name) { |n| "SV-#{n}" }
    song_history
  end
end
