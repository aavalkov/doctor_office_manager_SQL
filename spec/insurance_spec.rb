require 'rspec'
require 'spec_helper'

describe Insurance do

  describe 'initialize' do
    it 'initializes with a name'do
      new_insurance = Insurance.new({'name' => 'Kaimoda'})
      expect(new_insurance).to be_an_instance_of Insurance
    end
  end

  describe 'self.all' do
    it 'puts all insurance info from the database into an array' do
      expect(Insurance.all).to eq []
    end
  end

  describe 'save' do
    it 'saves an insurance company to the database' do
      new_insurance = Insurance.new({'name' => 'Kaimoda'})
      new_insurance.save
      expect(Insurance.all).to eq [new_insurance]
    end
  end
  describe '==' do
    it 'makes two objcts equal to each other if they have the same name' do
      new_insurance = Insurance.new({'name' => 'Kaimoda'})
      new_insurance_two = Insurance.new({'name' => 'Kaimoda'})
      expect(new_insurance).to eq new_insurance_two
    end
  end
end
