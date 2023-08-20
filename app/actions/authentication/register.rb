# frozen_string_literal: true

module SocialVibeTracker
  module Actions
    module Authentication
      class Register < SocialVibeTracker::Action
        include Deps["persistence.rom"]

        prepare do
          contract :new_user
        end

        def handle(request, response)
          halt 422 unless self.class.valid_params?(request.params[:user])

          # user = rom.relations[:users].changeset(:create, request.params[:user]).map(:add_timestamps).commit

          response.format = :json
          response.body = {result: 'Hello'}.to_json
        end
      end
    end
  end
end
