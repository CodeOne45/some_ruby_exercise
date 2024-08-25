module Pricing
    class PricingStrategy
      def calculate(rental)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end

      def to_hash(rental)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
end