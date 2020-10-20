require 'minitest/autorun'
require './lib/renter'
require './lib/apartment'

class RenterTest < Minitest::Test
    def setup
        @renter1 = Renter.new("Jessie")
        @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    end
    
    def test_renter_has_name
        assert_equal "Jessie", @renter1.name
    end

    def test_apartment_has_initialized_attributes
        assert_equal "A1", @unit1.number
        assert_equal 1200, @unit1.monthly_rent
        assert_equal 1, @unit1.bathrooms
        assert_equal 1, @unit1.bedrooms
    end

    def test_apartment_can_add_renter
        assert_nil @unit1.renter
        @unit1.add_renter(@renter1)
        assert_instance_of Renter, @unit1.renter 
    end
    
end