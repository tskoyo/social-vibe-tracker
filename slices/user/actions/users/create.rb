# frozen_string_literal: true

module User
  module Actions
    module Users
      class Create < User::Action
        include Deps["persistence.rom"]

        prepare do
          contract :new_user
          repository :user
        end

        def handle(request, response)
          halt 422 unless self.class.valid_params?(request.params[:user])

          user = rom.relations[:users].changeset(:create, request.params[:user]).map(:add_timestamps).commit

          response.format = :json
          response.body = {message: user}.to_json
        end
      end
    end
  end
end
