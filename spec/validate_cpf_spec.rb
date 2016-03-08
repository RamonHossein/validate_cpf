require 'spec_helper'

describe ValidateCpf do
  context 'should be invalid' do
    context 'wrong number' do
      it '123.456.789-10' do
        expect(ValidateCpf::Cpf.new("123.456.789-10")).to_not be_valid
      end

      it '12345678910' do
        expect(ValidateCpf::Cpf.new("12345678910")).to_not be_valid
      end

      it '0123456789' do
        expect(ValidateCpf::Cpf.new("0123456789")).to_not be_valid
      end

      it '1234567891011' do
        expect(ValidateCpf::Cpf.new("1234567891011")).to_not be_valid
      end

      it 'A2C.4E6.G8I-10' do
        expect(ValidateCpf::Cpf.new("A2C.4E6.G8I-10")).to_not be_valid
      end
    end

    context 'blacklist' do
      it '111.111.111-11' do
        expect(ValidateCpf::Cpf.new("111.111.111-11")).to_not be_valid
      end

      it '555555555-55' do
        expect(ValidateCpf::Cpf.new("555555555-55")).to_not be_valid
      end

      it '99999999999' do
        expect(ValidateCpf::Cpf.new("99999999999")).to_not be_valid
      end
    end
  end

  context 'should be valid' do
    context 'right number' do
      it '149.944.216-50' do
        expect(ValidateCpf::Cpf.new("149.944.216-50")).to be_valid
      end

      it '14994421650' do
        expect(ValidateCpf::Cpf.new("14994421650")).to be_valid
      end

      it '98058281824' do
        expect(ValidateCpf::Cpf.new("98058281824")).to be_valid
      end

      it '113.115.353-73' do
        expect(ValidateCpf::Cpf.new("113.115.353-73")).to be_valid
      end

      it '45721882620' do
        expect(ValidateCpf::Cpf.new("45721882620")).to be_valid
      end

      it '173.006.199-08' do
        expect(ValidateCpf::Cpf.new("173.006.199-08")).to be_valid
      end
    end

    context 'without number' do
      it 'blank' do
        expect(ValidateCpf::Cpf.new("")).to be_valid
      end

      it 'nil' do
        expect(ValidateCpf::Cpf.new(nil)).to be_valid
      end
    end
  end
end
