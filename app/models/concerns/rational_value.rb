# frozen_string_literal: true

module RationalValue
    extend ActiveSupport::Concern

    included do
      def value
        Rational(value_numerator, value_denominator)
      end
    end

  end
