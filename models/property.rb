require('pg')

class Property

  attr_accessor :address, :value, :number_of_bedrooms, :year_built

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @address = details['address'] if details['address']
    @value = details['value'].to_i()
    @number_of_bedrooms = details['number_of_bedrooms'].to_i()
    @year_built = details['year_built'].to_i()
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO properties
    (address, value, number_of_bedrooms, year_built)
    VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@address, @value, @number_of_bedrooms, @year_built]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i()
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all", [])
    db.close()
  end

  def Property.all()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties;"
    db.prepare("all", sql)
    property_list = db.exec_prepared("all", [])
    db.close()
    return property_list.map{ |property| Property.new(property) }
  end

  def delete()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties WHERE id = $1;"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE properties SET
    (address, value, number_of_bedrooms, year_built)
    = ($1, $2, $3, $4) WHERE id = $5
    "
    values = [@address, @value, @number_of_bedrooms, @year_built, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def find_by_id()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE id = $1;"
    values = [@id]
    db.prepare("find_by_id", sql)
    db.exec_prepared("find_by_id", values)
    db.close()
  end

  def find_by_address()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE address = $1;"
    values = [@address]
    db.prepare("find_by_address", sql)
    db.exec_prepared("find_by_address", values)
    db.close()
  end
end
