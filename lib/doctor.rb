class Doctor
  attr_reader(:name, :specialty, :id)

  def initialize(doctor_info)
    @name = doctor_info['name']
    @specialty = doctor_info['specialty']
    @id = doctor_info['id'].to_i
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

  def save
    result = DB.exec("INSERT INTO doctor (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == (another_doctor)
    self.name == another_doctor.name && self.specialty == another_doctor.specialty
  end
end
