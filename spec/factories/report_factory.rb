FactoryGirl.define do
  factory :report do
    title { "Report #{SecureRandom.uuid[0..10]}" }
    description 'Post body'
  end
end
