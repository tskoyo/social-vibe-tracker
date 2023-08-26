# frozen_string_literal: true

module User
  module Entities
    class User < ROM::Struct
      def full_name
        "#{first_name} #{last_name}"
      end
    end
  end
end
