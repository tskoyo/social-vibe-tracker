# frozen_string_literal: true

module User
  module Entities
    class User < ROM::Struct
      attribute :first_name, SocialVibeTracker::Types::String
      attribute :last_name, SocialVibeTracker::Types::String
      attribute :email, SocialVibeTracker::Types::String
      attribute :password, SocialVibeTracker::Types::String

      def full_name
        "#{first_name} #{last_name}"
      end
    end
  end
end
