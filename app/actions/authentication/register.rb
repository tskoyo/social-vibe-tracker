# frozen_string_literal: true

module SocialVibeTracker
  module Actions
    module Authentication
      class Register < SocialVibeTracker::Action
        # rule(:email) do
        #   unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
        #     key.failure('has invalid format')
        #   end
        # end

        def handle(*, response)
          books = [
            { "title" => "Test Driven Development" },
            { "title" => "Practical Object-Oriented Design in Ruby" }
          ]

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
