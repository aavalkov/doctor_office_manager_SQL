require 'rspec'
require 'spec_helper'

describe Doctor do
  describe 'initialize' do
    it 'intializes with a name and a specialty' do
      test_doctor = Doctor.new({'name' => "Cornelius Flanerty",'specialty' => "proctology"})
      expect(test_doctor).to be_an_instance_of Doctor
    end
  end

  describe 'self.all' do
    it "pulls all current doctor's names from the database and puts them in an array" do
      expect(Doctor.all).to eq []
    end
  end

  describe 'save' do
    it 'saves a new doctor to the database' do
      test_doctor = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      test_doctor.save
      expect(Doctor.all).to eq [test_doctor]
    end
  end

  describe '==' do
    it 'makes two objects equal to each other if they have the same name and specialty' do
      test_doctor = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      test_doctor_two = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      expect(test_doctor).to eq test_doctor_two
    end
  end
end
