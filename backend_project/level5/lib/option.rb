class Option
    PRICES = {
        'gps' => 500,
        'baby_seat' => 200,
        'additional_insurance' => 1000
    }

    attr_reader :type

    def initialize(type)
        @type = type
    end

    def price_per_day
        PRICES[type]
    end

    def beneficiary
        type == 'additional_insurance' ? 'drivy' : 'owner'
    end
end