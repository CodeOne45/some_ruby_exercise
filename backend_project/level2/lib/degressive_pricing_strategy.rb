require_relative '../../level1/lib/pricing/default_pricing_strategy'


module Pricing
    class DegressivePricingStrategy < DefaultPricingStrategy
      private

      def time_component(rental)
        total = 0
        (1..rental.duration).each do |day|
          total += case day
                   when 1 then rental.car.price_per_day
                   when 2..4 then rental.car.price_per_day * 0.9
                   when 5..10 then rental.car.price_per_day * 0.7
                   else rental.car.price_per_day * 0.5
                   end
        end
        total.to_i
      end
    end
end