class Validator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ValidateCpf.new(value).valid?
      record.errors[attribute] << (options[:message] || "this document is invalid")
    end
  end
end
