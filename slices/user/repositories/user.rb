# frozen_string_literal: true

class User::Repositories::User < SocialVibeTracker::Repository[:users]
  struct_namespace User::Entities
  auto_struct true

  def create(data)
    users.changeset(:create, data).map(:add_timestamps).commit
  end

  def query(conditions)
    users.where(conditions).to_a
  end

  def by_id(id)
    users.by_pk(id).one
  end
end
