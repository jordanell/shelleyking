require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryGirl.create(:report)
  end

  subject{ @report }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:position) }

  # Validations
  it 'should have a title' do
    @report.title = nil

    @report.should_not be_valid
  end
end
