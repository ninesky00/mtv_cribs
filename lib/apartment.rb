class Apartment
    attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter
    def initialize(hash)
        @number = hash[:number]
        @monthly_rent = hash[:monthly_rent]
        @bathrooms = hash[:bathrooms]
        @bedrooms = hash[:bedrooms]     
        @renter = nil   
    end

    def add_renter(renter)
        @renter = renter
    end
end