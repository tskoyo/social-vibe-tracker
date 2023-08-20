# frozen_string_literal: true

module User
  module Contracts
    # Validation for creating a new user
    class NewUserContract < Dry::Validation::Contract
      SPECIAL_CHARACTERS = %r/[!@#$%^&*()\-_=+{}\[\]:;"'<>,.?\\\/]/
      NUMBER = /\d/

      params do
        required(:email).value(:string)
        required(:first_name).value(:string)
        required(:last_name).value(:string)
        required(:password).value(:string)
        required(:password_confirmation).value(:string)
      end

      rule(:first_name) do
        key.failure('first_name must be filled') if values[:first_name].empty?
      end

      rule(:last_name) do
        key.failure('last_name must be filled') if values[:last_name].empty?
      end

      rule(:email) do
        unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
          key.failure('invalid format')
        end
      end

      rule(:password) do
        key.failure('must contain at least one uppercase letter') unless value.match(/[A-Z]/)
        key.failure('must contain at least one lowercase letter') unless value.match(/[a-z]/)
        key.failure('must contain at least one special character') unless value.match(SPECIAL_CHARACTERS)
        key.failure('must contain at least one number') unless value.match(NUMBER)
      end

      rule(:password_confirmation) do
        key.failure('must match password') if values[:password] != value
      end
    end
  end
end
