require_relative 'lib/rental_calculator'


calculator = Level3RentalCalculator.new('level3/data/input.json')
result = calculator.calculate_rentals

File.write('level3/data/output.json', JSON.pretty_generate({ rentals: result }))
puts "Output written to data/output.json"