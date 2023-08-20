# frozen_string_literal: true

module User
  class Routes < Hanami::Routes
    post '/create', to: 'users.create'
  end
end
