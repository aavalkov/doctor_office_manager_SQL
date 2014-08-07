require 'rspec'
require 'spec_helper'

describe Doctor do
  describe 'initialize' do
    it 'intializes with a name and a specialty' do
      test_doctor = Doctor.new({:name => "Cornelius Flanerty", :specialty => "proctology"})
      expect(test_doctor).to be_an_instance_of Doctor
    end
  end
end
