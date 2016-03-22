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

class Testimonial < ActiveRecord::Base
  acts_as_list

  validates :quote, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
  validates :featured, inclusion: { in: [true, false] }
end
