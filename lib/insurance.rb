class Insurance
  attr_reader(:name,:id)

  def initialize(insurance_info)
    @name = insurance_info['name']
    @id = insurance_info['id'].to_i
  end

  def self.all
    insurance = []
    results = DB.exec("SELECT * FROM insurance;")
    results.each do |result|
      new_insurance = Insurance.new(result)
      insurance << new_insurance
    end
    insurance
  end

  def save
    result = DB.exec("INSERT INTO insurance (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == (other_insurance)
    self.name == other_insurance.name
  end

end
