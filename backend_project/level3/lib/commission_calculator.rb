class CommissionCalculator
    INSURANCE_RATE = 0.5
    ASSISTANCE_DAILY_FEE = 100

    def calculate(rental)
      total_commission = (rental.price * 0.3).to_i
      insurance_fee = (total_commission * INSURANCE_RATE).to_i
      assistance_fee = rental.duration * ASSISTANCE_DAILY_FEE
      drivy_fee = total_commission - insurance_fee - assistance_fee

      {
        insurance_fee: insurance_fee,
        assistance_fee: assistance_fee,
        drivy_fee: drivy_fee
      }
    end
end