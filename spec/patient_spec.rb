require 'rspec'
require 'spec_helper'

describe Patient do
  describe 'initialize' do
    it 'initializes with a name and a birthday' do
      new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => 1934-05-10})
      expect(new_patient).to be_an_instance_of Patient
    end
  end

  describe 'self.all' do
    it 'pulls all patient info from the database and puts it into an array' do
      expect(Patient.all).to eq []
    end
  end

end
