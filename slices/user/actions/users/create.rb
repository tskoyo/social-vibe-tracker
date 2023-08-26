# frozen_string_literal: true

module User
  module Actions
    module Users
      class Create < User::Action
        include Deps[
          contract: 'contracts.new_user_contract',
          repo: 'repositories.user'
        ]

        def handle(request, response)
          halt 422 unless contract.call(request.params[:user]).success?

          user = repo.create(request.params[:user])

          response.format = :json
          response.body = {data: user}.to_json
        end
      end
    end
  end
end
