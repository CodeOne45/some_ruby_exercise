require_relative '../../level1/lib/rental_calculator'
require_relative 'rental'
require_relative 'commission_calculator'
require_relative '../../level2/lib/degressive_pricing_strategy'


class Level3RentalCalculator < RentalCalculator

  def initialize(rental_data, pricing_strategy = Pricing::DegressivePricingStrategy.new, commission_calculator = CommissionCalculator.new)
    super(rental_data, pricing_strategy)
    @commission_calculator = commission_calculator
  end

  private

  def create_rentals(rental_data, cars)
    rental_data.map do |rental|
      car = cars[rental['car_id']]
      raise "Car not found for rental #{rental['id']}" unless car

      Level3Rental.new(rental['id'], car, rental['start_date'], rental['end_date'], rental['distance'], @pricing_strategy, @commission_calculator)
    end
  end

end