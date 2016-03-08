class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ValidateCpf::Cpf.new(value).valid?
      record.errors[attribute] << (options[:message] || "this document is invalid")
    end
  end
end
