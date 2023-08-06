# frozen_string_literal: true

require "hanami/action"
require "pry"

module SocialVibeTracker
  class Action < Hanami::Action
    include Actionable
  end
end
