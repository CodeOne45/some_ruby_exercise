require_relative 'lib/rental_calculator'

calculator = RentalCalculator.new('level1/data/input.json')
result = calculator.calculate_rentals

File.write('level1/data/output.json', JSON.pretty_generate({ rentals: result }))
puts "Output written to data/output.json"