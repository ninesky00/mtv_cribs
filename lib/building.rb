require 'pry'
class Building
    attr_reader :units
    def initialize
        @units = []
        @renters
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
end