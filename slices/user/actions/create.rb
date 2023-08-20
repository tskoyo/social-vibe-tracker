# frozen_string_literal: true

module User
  module Actions
    class Create < User::Action
      prepare do
        contract :new_user
      end

      def handle(request, response)
        halt 422 unless self.class.valid_params?(request.params[:user])

        response.body = {message: "hello world"}.to_json
      end
    end
  end
end
