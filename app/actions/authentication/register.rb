# frozen_string_literal: true

module SocialVibeTracker
  module Actions
    module Authentication
      class Register < SocialVibeTracker::Action
        prepare do
          contract :new_user
        end

        def handle(*, response)
          response.format = :json
          response.body = {result: 'Hello'}.to_json
        end
      end
    end
  end
end
