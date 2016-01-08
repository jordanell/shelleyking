class Testimonial < ActiveRecord::Base
  acts_as_list

  validates :quote, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
  validates :featured, inclusion: { in: [true, false] }
end
