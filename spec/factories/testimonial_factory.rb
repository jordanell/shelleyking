# == Schema Information
#
# Table name: testimonials
#
#  id         :integer          not null, primary key
#  quote      :text             not null
#  name       :string           not null
#  featured   :boolean          default(FALSE)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :testimonial do
    quote { "Testimonial #{SecureRandom.uuid[0..10]}" }
    name { "Name #{SecureRandom.uuid[0..10]}" }
    featured false
  end
end
