require 'rspec'
require File.expand_path '../../spec_helper.rb', __FILE__

describe 'My Hello App' do

  it "says Hello" do
    get '/'
    expect(last_response.body).to include('Hello')
  end

  it "says Howdy for /howdy" do
    get '/howdy'
    expect(last_response.body).to include('Howdy')
  end
end