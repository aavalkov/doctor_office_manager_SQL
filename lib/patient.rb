class Patient
  attr_reader(:name, :birthday, :doctor_id, :id)

  def initialize(patient_info)
    @name = patient_info['name']
    @birthday = patient_info['birthday']
    @id = patient_info['id'].to_i
    @doctor_id = patient_info['doctor_id']
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

  def save
    result = DB.exec("INSERT INTO patient (name, birthday) VALUES ('#{@name}', '#{@birthday}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM patient WHERE id = #{self.id};")
  end

  def ==(another_patient)
    self.name == another_patient.name && self.birthday == another_patient.birthday
  end

  def assign_doctor(doctor_name)
    result = DB.exec("SELECT * FROM doctor WHERE name = '#{doctor_name}';")
    doc_id = result.first['id'].to_i
    DB.exec("UPDATE patient SET doctor_id = #{doc_id} WHERE name = '#{self.name}';")
    @doctor_id = doc_id
  end

  def doctor #easier way to do this??
    results = DB.exec("SELECT * FROM doctor WHERE id = #{self.doctor_id};")
    doctor_info =[]
    results.each do |result|
      match_doc = Doctor.new(result)
      doctor_info << match_doc
    end
    doctor_info[0]
  end
end
