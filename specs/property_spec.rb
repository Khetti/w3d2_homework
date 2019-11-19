require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/property.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PropertyTest < MiniTest::Test

  def test_can_create_property()
    property_details = {
      'address' => 'Place Street',
      'value' => 150000,
      'number_of_bedrooms' => 3,
      'year_built' => 2008
    }

    new_property = Property.new(property_details)
    assert_equal('Place Street', new_property.address)
  end

end
