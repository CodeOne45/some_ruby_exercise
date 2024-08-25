require_relative '../../level3/lib/rental_calculator'
require_relative 'rental'

class Level4RentalCalculator < Level3RentalCalculator

  private

  def create_rentals(rental_data, cars)
    rental_data.map do |rental|
      car = cars[rental['car_id']]
      raise "Car not found for rental #{rental['id']}" unless car

      Level4Rental.new(rental['id'], car, rental['start_date'], rental['end_date'], rental['distance'], @pricing_strategy, @commission_calculator)
    end
  end

end