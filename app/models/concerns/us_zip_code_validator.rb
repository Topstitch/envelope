class UsZipCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      return unless record.country == Address::USA
      return if basic_five_digit_zip_code?(value)
      return if hyphenated_nine_digit_zip_code?(value)
      record.errors.add(attribute, "wrong zip code format for USA")
    end
  end

  def basic_five_digit_zip_code?(original_value)
    sanitized_value = original_value.match(/\d{5}/)
    sanitized_value.present?
  end

  def hyphenated_nine_digit_zip_code?(original_value)
    sanitized_value = original_value.match(/\d{5}[\-]\d{4}/)
    sanitized_value.present?
  end
end