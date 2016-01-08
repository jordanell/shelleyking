require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  before do
    @testimonial = FactoryGirl.create(:testimonial)
  end

  subject{ @testimonial }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:quote) }
  it { should respond_to(:name) }
  it { should respond_to(:position) }
  it { should respond_to(:featured) }

  # Validations
  it 'should have a quote' do
    @testimonial.quote = nil

    @testimonial.should_not be_valid
  end

  it 'should not allow blank quote' do
    @testimonial.quote = ''

    @testimonial.should_not be_valid
  end

  it 'should have a name' do
    @testimonial.name = nil

    @testimonial.should_not be_valid
  end

  it 'should not allow a blank name' do
    @testimonial.name = ''

    @testimonial.should_not be_valid
  end

  it 'should not allow nil featured' do
    @testimonial.featured = nil

    @testimonial.should_not be_valid
  end
end
