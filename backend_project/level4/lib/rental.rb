require_relative '../../level3/lib/rental'

class Level4Rental < Level3Rental

    def actions
        commission =  @commission_calculator.calculate(self)
        [
          { who: 'driver', type: 'debit', amount: price },
          { who: 'owner', type: 'credit', amount: price - (commission[:insurance_fee] + commission[:assistance_fee] + commission[:drivy_fee]) },
          { who: 'insurance', type: 'credit', amount: commission[:insurance_fee] },
          { who: 'assistance', type: 'credit', amount: commission[:assistance_fee] },
          { who: 'drivy', type: 'credit', amount: commission[:drivy_fee] }
        ]
    end

    def to_hash
        {
            id: id,
            actions: actions
        }
    end

end