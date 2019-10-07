# frozen_string_literal: true

module RationalValue
    extend ActiveSupport::Concern

    included do
      validates :value_numerator, :value_denominator, numericality: { only_integer: true }

      def value
        Rational(value_numerator, value_denominator)
      end
    end

  end
