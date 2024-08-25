require_relative '../../level4/lib/rental'
require_relative 'option'

class Level5Rental < Level4Rental
    attr_reader :options

    def initialize(id, car, start_date, end_date, distance, pricing_strategy, commission_calculator, options)
        super(id, car, start_date, end_date, distance, pricing_strategy, commission_calculator)
        @options = options.map { |option_type| Option.new(option_type) }
    end

    def actions
        base_actions = super
        option_actions = calculate_option_actions

        base_actions.map do |action|
          if option_actions[action[:who]]
            action[:amount] += option_actions[action[:who]]
          end
          action
        end
    end

    def calculate_option_actions
        actions = { 'driver' => 0, 'owner' => 0, 'drivy' => 0 }

        options.each do |option|
            amount = option.price_per_day * duration
            actions['driver'] += amount
            actions[option.beneficiary] += amount
        end

        actions
    end

    def to_hash
        {
            id: id,
            options: options.map(&:type)
        }.merge(super)
    end
end