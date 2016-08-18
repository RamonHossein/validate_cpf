# ValidateCpf

[![Gem Version](https://badge.fury.io/rb/validate_cpf.png)](http://badge.fury.io/rb/validate_cpf)
[![Coverage Status](https://coveralls.io/repos/github/RamonHossein/validate_cpf/badge.svg)](https://coveralls.io/github/RamonHossein/validate_cpf)
[![Build Status](https://secure.travis-ci.org/RamonHossein/validate_cpf.png?branch=master)](http://travis-ci.org/RamonHossein/validate_cpf)

To read this documentation in English click [here](https://github.com/RamonHossein/validate_cpf/blob/master/README.md).

Adiciona suporte a validação do CPF para Rails (ActiveModel) testando de uma forma simples.

## Instalação

Adicione esta linha ao Gemfile de sua aplicação:

```ruby
gem 'validate_cpf'
```

E então execute:

    $ bundle

Ou instale ele próprio como:

    $ gem install validate_cpf

## Uso

Basta usar como qualquer outro validador:

```ruby
class User < ActiveRecord::Base
    validates :cpf, cpf: true
end
```

## Mensagem de erro

Se você precisar localizar a mensagem de erro, basta adicioná-la ao seu arquivo I18n locale:

```ruby
errors:
  messages:
    this_document_is_invalid: "Este documento é invalido"
```

Você pode fornecer sua própria mensagem usando: opção de mensagem.

```ruby
validates :cpf, cpf: {message: "nova mensagem de erro"}
```

## Mantido por:
[RamonHossein](https://github.com/RamonHossein)

## Contribuidores

Para ver as pessoas que têm contribuído com código, dê uma olhada na [lista de contribuintes](http://github.com/RamonHossein/validate_cpf/contributors).

## Contribuindo

1. Fork
2. Crie sua feature branch (`git checkout -b my-new-feature`)
3. Commit suas alterações (`git commit -am 'Added some feature'`)
4. Push para a branch (`git push origin my-new-feature`)
5. Crie um novo Pull Request

# Licença

A gem está disponível como código aberto sob os termos da [MIT License](http://opensource.org/licenses/MIT).
