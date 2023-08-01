# frozen_string_literal: true

module SocialVibeTracker
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }

    slice :authentication, at: "/authentication" do
      get "/registration/signup", to: "registration.signup"
      post "/registration", to: "registration.create"
    end
  end
end
