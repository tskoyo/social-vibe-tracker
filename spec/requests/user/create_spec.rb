# frozen_string_literal: true

RSpec.describe "POST /user/create", type: :request do
  it 'should return response with user data' do
    post 'user/create'

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    response_body = JSON.parse(last_response.body)
  end
end
