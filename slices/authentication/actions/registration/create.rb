# frozen_string_literal: true

module Authentication
  module Actions
    module Registration
      class Create < Authentication::Action
        contract do
          schema do
            required(:email).filled(:str?, format?: URI::MailTo::EMAIL_REGEXP)
            required(:password).filled(:str?, min_size?: 8)
            required(:password_confirmation).filled(:str?, min_size?: 8)
          end
      
          rule(:password_confirmation, :password) do
            key.failure("passwords do not match") if values[:password] != values[:password_confirmation]
          end
        end

        def handle(request, response)
          response.body = self.class.name
        end
      end
    end
  end
end
