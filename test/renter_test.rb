require 'minitest/autorun'
require './lib/renter'

class RenterTest < Minitest::Test
    def setup
        @renter1 = Renter.new("Jessie")
    end

    def test_renter_has_name
        assert_equal "Jessie", @renter1.name
    end
end