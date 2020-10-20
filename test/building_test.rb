require 'minitest/autorun'
require './lib/renter'
require './lib/apartment'
require .'/lib/building'

class BuildingTest < Minitest::Test
    def setup
        @building = Building.new
        @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
        @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
        @renter1 = Renter.new("Aurora")
        @renter2 = Renter.new("Tim")
    end

    def test_building_can_add_units
        assert_equal [], @building.units
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        assert_equal [@unit, @unit2], @building.units
    end

    def test_building_can_add_tenants
        @unit1.add_renter(@renter1)
        @building.add_unit(@unit1)
        @assert_equal ["Aurora"], @building.renters
        @unit2.add_renter(@renter2)
        @building.add_unit(@unit2)
        @assert_equal ["Aurora", "Tim"], @building.renters
    end

    def test_building_can_calculate_average_rent
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        assert_equal 1099.5, @building.average_rent
    end
end