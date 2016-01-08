FactoryGirl.define do
  factory :testimonial do
    quote { "Testimonial #{SecureRandom.uuid[0..10]}" }
    name { "Name #{SecureRandom.uuid[0..10]}" }
    featured false
  end
end
