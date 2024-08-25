require_relative '../../level1/lib/rental'

class Level3Rental < Rental

    attr_reader :commission_calculator

    def initialize(id, car, start_date, end_date, distance, pricing_strategy, commission_calculator)
        super(id, car, start_date, end_date, distance, pricing_strategy)
        @commission_calculator = commission_calculator
    end

    def to_hash
        super.merge(commission: @commission_calculator.calculate(self))
    end

end