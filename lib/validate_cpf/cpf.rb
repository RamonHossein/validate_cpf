module ValidateCpf
  class Cpf
    def initialize(document)
      @validate = validation(document)
    end

    def validation(document)
      return true if document.blank?
      return false if regex(document) == false
      return false if verify_blacklist(document) == true
      return validate?(document)
    end

    def valid?
      @validate
    end

    private

    def regex(document)
      doc = document =~ /^(\d{3}\.?\d{3}\.?\d{3})-?(\d{2})$/
      @number = $1
      @result = $2
      doc == 0 ? true : false
    end

    def validate?(document)
      @number = @number.gsub(/[\.\/-]/,"")
      @result == (first_verification + second_verification) ? true : false
    end

    def first_verification
      sum = multiply_sum([10, 9, 8, 7, 6, 5, 4, 3, 2, 1], @number)
      verification(sum%11).to_s
    end

    def second_verification
      sum = multiply_sum([11, 10, 9, 8, 7, 6, 5, 4, 3, 2], (@number + first_verification))
      verification(sum%11).to_s
    end

    def multiply_sum(array, number)
      multiply = []
      number.scan(/\d{1}/).each_with_index { |e, i| multiply[i] = e.to_i * array[i] }
      multiply.inject { |s, e| s + e }
    end

    def verification(rest)
      rest < 2 ? 0 : (11 - rest)
    end

    def formal_cpf(document)
      document = document.gsub(/[\.-]/, "")
      document =~ /(\d{3})(\d{3})(\d{3})(\d{2})/
      return "#{$1}.#{$2}.#{$3}-#{$4}"
    end

    def verify_blacklist(document)
      cpf = formal_cpf(document)
      BLACKLIST.include?(cpf)
    end

    BLACKLIST= [
      "000.000.000-00",
      "111.111.111-11",
      "222.222.222-22",
      "333.333.333-33",
      "444.444.444-44",
      "555.555.555-55",
      "666.666.666-66",
      "777.777.777-77",
      "888.888.888-88",
      "999.999.999-99"
    ]
  end
end
