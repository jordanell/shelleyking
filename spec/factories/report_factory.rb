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

FactoryGirl.define do
  factory :report do
    title { "Report #{SecureRandom.uuid[0..10]}" }
    description 'Post body'
    report_file_file_name 'test_report.pdf'
    report_file_content_type 'pdf'
    report_file_file_size 10
    report_file_updated_at Time.now
  end
end
