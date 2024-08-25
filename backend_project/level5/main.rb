require_relative 'lib/rental_calculator'

calculator = Level5RentalCalculator.new('level5/data/input.json')
result = calculator.calculate_rentals

File.write('level5/data/output.json', JSON.pretty_generate({ rentals: result }))
puts "Output written to data/output.json"