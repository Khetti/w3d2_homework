require ('pry')
require_relative('models/property.rb')

property1 = Property.new({
  'address' => '1 Street Place',
  'value' => 150000,
  'number_of_bedrooms' => 3,
  'year_built' => 2008
  })

property1.save()

binding.pry

nil
