class Doctor
  attr_reader(:name, :specialty, :id, :insurance_id)

  def initialize(doctor_info)
    @name = doctor_info['name']
    @specialty = doctor_info['specialty']
    @id = doctor_info['id'].to_i
    @insurance_id = doctor_info['insurance_id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM doctor;")
    doctors = []
    results.each do |result|
      new_doc = Doctor.new(result)
      doctors << new_doc
    end
    doctors
  end

  def self.specialty_list(specialty_name)
    results = DB.exec("SELECT * FROM doctor WHERE specialty = '#{specialty_name}';")
    doctors = []
    results.each do |result|
      new_doc = Doctor.new(result)
      doctors << new_doc.name
    end
    doctors
  end

  def assign_insurance(insurance_name)
    result = DB.exec("SELECT * FROM insurance WHERE name = '#{insurance_name}';")
    insur_id = result.first['id'].to_i
    DB.exec("UPDATE doctor SET insurance_id = #{insur_id} WHERE name = '#{self.name}'")
    @insurance_id = insur_id
  end

  def delete
    DB.exec("DELETE FROM doctor WHERE id = #{self.id};")
  end

  def save
    result = DB.exec("INSERT INTO doctor (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == (another_doctor)
    self.name == another_doctor.name && self.specialty == another_doctor.specialty
  end
end
