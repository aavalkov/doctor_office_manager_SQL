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

  describe 'self.specialty_list' do
    it 'returns all doctors with a given specialty' do
      test_doctor_one = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      test_doctor_two = Doctor.new({'name' => "Reginold Haymaker", 'specialty' => "proctology"})
      test_doctor_three = Doctor.new({'name' => "Sir Winston Scrumptious", 'specialty' => "OBGYN"})
      test_doctor_one.save
      test_doctor_two.save
      test_doctor_three.save
      expect(Doctor.specialty_list("proctology")).to eq (["Cornelius Flanerty", "Reginold Haymaker"])
    end
  end

  describe 'assign_insurance' do
    it 'gives a doctor an insurance'do
      test_doctor = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      test_doctor.save
      test_doctor.assign_insurance('Red Shield')
      expect(test_doctor.insurance_id).to eq 1
    end
  end

  describe 'delete' do
    it 'deletes a doctor from the database' do
      test_doctor = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      test_doctor.save
      test_doctor.delete
      expect(Doctor.all).to eq []
    end
  end
end










