# frozen_string_literal: true

module User
  module Serializers
    class User
      def initialize(user)
        @user = user
      end

      def as_hash
        {
          email: @user.email,
          name: @user.full_name
        }
      end
    end
  end
end
