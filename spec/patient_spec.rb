require 'rspec'
require 'spec_helper'

describe Patient do
  it 'initializes with a name and a birthday' do
    new_patient = Patient.new({'name' => 'Colonel Assmaster', 'birthday' => 1934-05-10})
    expect(new_patient).to be_an_instance_of Patient
  end
end
