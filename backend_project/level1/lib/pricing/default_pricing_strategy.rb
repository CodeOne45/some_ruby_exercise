require_relative 'pricing_strategy'

module Pricing
    class DefaultPricingStrategy < PricingStrategy

      def calculate(rental)
        time_component(rental) + distance_component(rental)
      end

      def to_hash(rental)
        {
          id: rental.id,
          price: calculate(rental)
        }
      end

      private

      def time_component(rental)
        rental.duration * rental.car.price_per_day
      end

      def distance_component(rental)
        rental.distance * rental.car.price_per_km
      end

    end
end