require 'rails_helper'

describe 'listings/index.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end
end
