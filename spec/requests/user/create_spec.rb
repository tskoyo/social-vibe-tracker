# frozen_string_literal: true

RSpec.describe "POST /user/create", type: :request do
  let(:expected_response) do
    {
    name: 'John Doe',
    email: 'johndoe@test.com'
    }
    end
  it 'should return response with user data' do
    post 'user/create'

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    response_body = JSON.parse(last_response.body)
  end
end
