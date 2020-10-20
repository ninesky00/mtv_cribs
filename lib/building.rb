require 'pry'
class Building
    attr_reader :units
    def initialize
        @units = []
        @renters
        @rented_units
    end

    def add_unit(unit)
        @units << unit
    end

    def average_rent
        total_rent = @units.inject(0) {|sum, unit| sum += unit.monthly_rent}
        (total_rent.to_f / 2).round(1)
    end

    def renters
        @renters = @units.map {|unit| unit.renter.name}
    end

    def rented_units
       @rented_units = @units.select {|unit| unit.renter != nil} 
    end

    def renter_with_highest_rent
        rented_units.max_by {|unit| unit.monthly_rent}
    end

    def units_by_number_of_bedrooms
        @units.group_by {|unit| unit.bedrooms}
    end
end