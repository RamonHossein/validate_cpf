require 'spec_helper'
require 'fake_person/person'

describe ValidateCpf do
  before :each do
    allow(I18n).to receive(:t).with("errors.messages.this_document_is_invalid").and_return("This document is invalid")
  end

  context "invalid document" do
    context "Menssage error" do
      it "pattern 'This document is invalid'" do
        person = Person.new(cpf: "111.111.111-11")

        person.valid?
        expect(person.errors[:cpf]).to eq ["This document is invalid"]
      end

      it "customized 'new message'" do
        person = PersonCustomized.new(cpf: "123.456.789-100")

        person.valid?
        expect(person.errors[:cpf]).to eq ["new message"]
      end
    end

    context 'wrong number' do
      # Wrong validations
      it '123.456.789-10' do
        person = Person.new(cpf: "123.456.789-10")
        expect(person.valid?).to be_falsey
      end

      it '12345678910' do
        person = Person.new(cpf: "12345678910")
        expect(person.valid?).to be_falsey
      end

      # Wrong format
      it '123.456.789-100' do
        person = Person.new(cpf: "123.456.789-100")
        expect(person.valid?).to be_falsey
      end

      # Wrong format
      it '123.456.7891-10' do
        person = Person.new(cpf: "123.456.7891-10")
        expect(person.valid?).to be_falsey
      end

      it '0123456789' do
        person = Person.new(cpf: "0123456789")
        expect(person.valid?).to be_falsey
      end

      it '1234567891011' do
        person = Person.new(cpf: "1234567891011")
        expect(person.valid?).to be_falsey
      end

      it 'A2C.4E6.G8I-10' do
        person = Person.new(cpf: "A2C.4E6.G8I-10")
        expect(person.valid?).to be_falsey
      end
    end

    context 'blacklist' do
      it '111.111.111-11' do
        person = Person.new(cpf: "111.111.111-11")
        expect(person.valid?).to be_falsey
      end

      it '555555555-55' do
        person = Person.new(cpf: "555555555-55")
        expect(person.valid?).to be_falsey
      end

      it '99999999999' do
        person = Person.new(cpf: "99999999999")
        expect(person.valid?).to be_falsey
      end
    end
  end

  context 'should be valid' do
    context 'right number' do
      it '149.944.216-50' do
        person = Person.new(cpf: "149.944.216-50")
        expect(person.valid?).to be_truthy
      end

      it '14994421650' do
        person = Person.new(cpf: "14994421650")
        expect(person.valid?).to be_truthy
      end

      it '98058281824' do
        person = Person.new(cpf: "98058281824")
        expect(person.valid?).to be_truthy
      end

      it '113.115.353-73' do
        person = Person.new(cpf: "113.115.353-73")
        expect(person.valid?).to be_truthy
      end

      it '45721882620' do
        person = Person.new(cpf: "45721882620")
        expect(person.valid?).to be_truthy
      end

      it '173.006.199-08' do
        person = Person.new(cpf: "173.006.199-08")
        expect(person.valid?).to be_truthy
      end
    end

    context 'without number' do
      it 'blank' do
        person = Person.new(cpf: "")
        expect(person.valid?).to be_truthy
      end

      it 'nil' do
        person = Person.new(cpf: nil)
        expect(person.valid?).to be_truthy
      end
    end
  end
end
