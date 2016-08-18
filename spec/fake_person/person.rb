class Person
  include ActiveModel::Validations

  attr_accessor :cpf

  validates :cpf, cpf: true

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end

class PersonCustomized
  include ActiveModel::Validations

  attr_accessor :cpf

  validates :cpf, cpf: {message: "new message"}

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end


