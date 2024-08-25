require_relative 'lib/rental_calculator'

calculator = Level4RentalCalculator.new('level4/data/input.json')
result = calculator.calculate_rentals

File.write('level4/data/output.json', JSON.pretty_generate({ rentals: result }))
puts "Output written to data/output.json"