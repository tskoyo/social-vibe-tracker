# frozen_string_literal: true

module User
  class Routes < Hanami::Routes
    post '/users', to: 'users.create'
  end
end
