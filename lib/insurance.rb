class Insurance
  attr_reader(:name,:id)

  def initialize(insurance_info)
    @name = insurance_info['name']
    @id = insurance_info['id'].to_i
  end
end
