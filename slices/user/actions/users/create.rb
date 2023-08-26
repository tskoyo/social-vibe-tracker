# frozen_string_literal: true

module User
  module Actions
    module Users
      class Create < User::Action
        prepare do
          contract :new_user
          repository :user
        end

        def handle(request, response)
          halt 422 unless self.class.valid_params?(request.params[:user])

          user = @@user_repo.create(request.params[:user])

          response.format = :json
          response.body = {data: user}.to_json
        end
      end
    end
  end
end
