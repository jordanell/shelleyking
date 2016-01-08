require 'rails_helper'

describe TestimonialsController, type: :controller do
  render_views

  describe '#index' do
    it 'should render the index template' do
      get :index

      response.should render_template('index')
    end

    it 'should set the testimonials instance variable' do
      @testimonial = FactoryGirl.create(:testimonial)

      get :index

      expect(assigns(:testimonials)).to eq([@testimonial])
    end

    it 'should order the testimonials by position' do
      @testimonial1 = FactoryGirl.create(:testimonial, position: 1)
      @testimonial2 = FactoryGirl.create(:testimonial, position: 2)

      get :index

      expect(assigns(:testimonials)).to eq([@testimonial1, @testimonial2])
    end
  end
end
