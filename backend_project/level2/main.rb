require_relative '../level1/lib/rental_calculator'
require_relative 'lib/degressive_pricing_strategy'


calculator = RentalCalculator.new('level2/data/input.json', Pricing::DegressivePricingStrategy.new)

result = calculator.calculate_rentals

File.write('level2/data/output.json', JSON.pretty_generate({ rentals: result }))
puts "Output written to data/output.json"