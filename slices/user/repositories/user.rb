# frozen_string_literal: true

module User
  module Repositories
    class User < SocialVibeTracker::Repository[:users]
      struct_namespace User::Entities
      auto_struct true

      def create(data)
        users.command(:create).call(data)
      end

      def query(conditions)
        users.where(conditions).to_a
      end

      def by_id(id)
        users.by_pk(id).one
      end
    end
  end
end
