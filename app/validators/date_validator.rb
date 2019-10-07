# frozen_string_literal: true

class DateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      begin
        Date.parse(value)
      rescue
        errors.add(attribute)
      end
    end
  end
