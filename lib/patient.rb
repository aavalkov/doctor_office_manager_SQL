class Patient
  attr_reader(:name, :birthday)

  def initialize(patient_info)
    @name = patient_info['name']
    @birthday = patient_info['birthday']
    @id = patient_info['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM patient;")
    patients = []
    results.each do |result|
      new_patient = Patient.new(result)
      patients << new_patient
    end
    patients
  end
end
