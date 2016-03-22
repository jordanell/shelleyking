# == Schema Information
#
# Table name: reports
#
#  id                       :integer          not null, primary key
#  title                    :string           not null
#  description              :text
#  position                 :integer
#  created_at               :datetime
#  updated_at               :datetime
#  report_file_file_name    :string
#  report_file_content_type :string
#  report_file_file_size    :integer
#  report_file_updated_at   :datetime
#

class Report < ActiveRecord::Base
  acts_as_list

  has_attached_file :report_file,
                    storage: :s3,
                    s3_credentials: S3_CONFIG_FILE,
                    bucket: S3_CONFIG['reports_bucket']

  validates :title, presence: true, allow_blank: false

  validates_attachment :report_file, presence: true

  do_not_validate_attachment_file_type :report_file

  # Rails admin config
  rails_admin do
    edit do
      field :title
      field :description
      field :report_file, :paperclip
      field :position
    end
  end
end
