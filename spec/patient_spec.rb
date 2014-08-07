require 'rspec'
require 'spec_helper'

describe Patient do
  describe 'initialize' do
    it 'initializes with a name and a birthday' do
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10"})
      expect(new_patient).to be_an_instance_of Patient
    end
  end

  describe 'self.all' do
    it 'pulls all patient info from the database and puts it into an array' do
      expect(Patient.all).to eq []
    end
  end

  describe 'save' do
    it 'saves a patient into the database' do
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10"})
      new_patient.save
      expect(Patient.all).to eq [new_patient]
    end
  end

  describe 'assign_doctor' do
    it 'links a doctor to a specific patient' do
      new_doctor = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      new_doctor.save
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10"})
      new_patient.save
      new_patient.assign_doctor("Cornelius Flanerty")
      expect(new_patient.doctor_id).to eq new_doctor.id
    end
  end

  describe 'doctor' do
    it 'returns the associated doctor' do
      new_doctor = Doctor.new({'name' => "Cornelius Flanerty", 'specialty' => "proctology"})
      new_doctor.save
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10", 'doctor_id' => new_doctor.id})
      new_patient.save
      expect(new_patient.doctor).to eq new_doctor
      expect(new_patient.doctor.name).to eq "Cornelius Flanerty"
      expect(new_patient.doctor.specialty).to eq "proctology"
    end
  end

  describe 'delete' do
    it 'deletes a patient from the database' do
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10"})
      new_patient.save
      new_patient.delete
      expect(Patient.all).to eq []
    end
  end

  describe "==" do
    it 'allows two objects with the same name and birthday to equal eachother' do
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10"})
      new_patient_two = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => "1934-05-10"})
      expect(new_patient).to eq new_patient_two
    end
  end
end
