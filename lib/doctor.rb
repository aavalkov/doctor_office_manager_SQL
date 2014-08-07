class Doctor
  attr_reader(:name, :specialty)

  def initialize(doctor_info)
    @name = doctor_info[:name]
    @specialty = doctor_info[:specialty]
  end
end
