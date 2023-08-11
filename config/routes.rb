# frozen_string_literal: true

module SocialVibeTracker
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }

    post "/authentication/sign-up", to: "authentication.register"
  end
end
