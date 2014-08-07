require 'rspec'
require 'spec_helper'

describe Insurance do

  describe 'initialize' do
    it 'initializes with a name'do
      new_insurance = Insurance.new({'name' => 'Kaimoda'})
      expect(new_insurance).to be_an_instance_of Insurance
    end
  end
end
