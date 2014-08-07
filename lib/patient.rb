class Patient
  attr_reader(:name, :birthday)

  def initialize(patient_info)
    @name = patient_info['name']
    @birthday = patient_info['birthday']
    @id = patient_info['id'].to_i
  end
end
