# frozen_string_literal: true

Hanami.configure do
  case Hanami.env
  when 'test'
    Hanami::Model.configure do
      url = ENV['DATABASE_URL']
      adapter type: :sql, uri: url if url
    end
  end
end
