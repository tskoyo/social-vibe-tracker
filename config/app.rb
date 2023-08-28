# frozen_string_literal: true

require "hanami"
require "pry"

module SocialVibeTracker
  class App < Hanami::App
    config.middleware.use :body_parser, :json
  end
end
