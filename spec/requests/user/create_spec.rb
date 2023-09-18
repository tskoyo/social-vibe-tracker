# frozen_string_literal: true

RSpec.describe 'POST /user/create', type: :request do
  let(:email) { 'johndoe1@test.com' }
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:password) { 'pa44$w0rD' }
  let(:password_confirmation) { 'pa44$w0rD' }
  
  let(:params) do
    { user: { email:, first_name:, last_name:, password:, password_confirmation: } }
  end

  let(:request_headers) do
    {'HTTP_ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json'}
  end
  
  let(:expected_response) do
    {
      name: 'John Doe',
      email: 'johndoe@test.com'
    }
  end

  describe 'user creation' do
    context 'invalid params' do
      let(:email) { 'johndoe' }

      it 'returns 422 unprocessable' do
        post '/user/create', params.to_json, request_headers

        expect(last_response).to be_unprocessable
      end
    end

    context 'valid params' do
      it 'creates a user' do
        post '/user/create', params.to_json, request_headers

        expect(last_response).to be_successful
      end
    end
  end
end
