require 'date'

class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance

    def initialize(id, car, start_date, end_date, distance, pricing_strategy)
        @id = id
        @car = car
        @start_date = Date.parse(start_date)
        @end_date = Date.parse(end_date)
        @distance = distance
        @pricing_strategy = pricing_strategy
    end

    def price
        @pricing_strategy.calculate(self)
    end

    def duration
        (@end_date - @start_date).to_i + 1
    end

    def to_hash
        @pricing_strategy.to_hash(self)
    end

end