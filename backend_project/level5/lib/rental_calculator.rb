require_relative '../../level4/lib/rental_calculator'
require_relative 'rental'

class Level5RentalCalculator < Level4RentalCalculator
  def initialize(input_file)
    super
    @options = load_options
  end

  private

  def load_options
    load_data['options'] || []
  end

  def create_rentals(rental_data, cars)
    rental_data.map do |rental|
      car = cars[rental['car_id']]
      raise "Car not found for rental #{rental['id']}" unless car

      options = @options.select { |option| option['rental_id'] == rental['id'] }.map { |option| option['type'] } || []
      Level5Rental.new(rental['id'], car, rental['start_date'], rental['end_date'], rental['distance'], @pricing_strategy, @commission_calculator, options)
    end
  end

end