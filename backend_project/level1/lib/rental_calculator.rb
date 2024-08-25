require 'json'
require_relative 'car'
require_relative 'rental'
require_relative 'pricing/default_pricing_strategy'

class RentalCalculator
    def initialize(input_file, pricing_strategy = Pricing::DefaultPricingStrategy.new)
        @input_file = input_file
        @pricing_strategy = pricing_strategy
    end

    def calculate_rentals
        data = load_data
        cars = create_cars(data['cars'])
        rentals = create_rentals(data['rentals'], cars)

        rentals.map(&:to_hash)
    end

    def load_data
        JSON.parse(File.read(@input_file))
    end

    def create_cars(car_data)
        car_data.each_with_object({}) do |car, hash|
          hash[car['id']] = Car.new(car['id'], car['price_per_day'], car['price_per_km'])
        end
    end

    def create_rentals(rental_data, cars)
        rental_data.map do |rental|
          car = cars[rental['car_id']]
          raise "Car not found for rental #{rental['id']}" unless car

          Rental.new(rental['id'], car, rental['start_date'], rental['end_date'], rental['distance'], @pricing_strategy)
        end
    end


end