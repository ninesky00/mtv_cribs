require 'minitest/autorun'
require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'pry'

class BuildingTest < Minitest::Test
    def setup
        @building = Building.new
        @renter1 = Renter.new("Aurora")
        @renter2 = Renter.new("Tim")
        @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
        @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
        @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
        @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    end

    def test_building_can_add_units
        #skip
        assert_equal [], @building.units
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        assert_equal [@unit1, @unit2], @building.units
    end

    def test_building_can_add_tenants
        assert_equal [], @building.renters
        
        @building.add_unit(@unit1)
        @unit1.add_renter(@renter1)
        assert_equal ["Aurora"], @building.renters
        
        @building.add_unit(@unit2)
        @unit2.add_renter(@renter2)
        
        assert_equal ["Aurora", "Tim"], @building.renters
    end

    def test_building_can_calculate_average_rent
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        assert_equal 1099.5, @building.average_rent
    end
end