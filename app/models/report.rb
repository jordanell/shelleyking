class Report < ActiveRecord::Base
  acts_as_list

  validates :title, presence: true, allow_blank: false
end
