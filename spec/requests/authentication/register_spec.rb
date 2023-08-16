# frozen_string_literal: true

require 'pry'

RSpec.describe "POST /authentication/sign-up", type: :request do
  let(:request_headers) do
    {"HTTP_ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json"}
  end

  let(:email) { 'john.doe' }
  let(:first_name) { '' }
  let(:last_name) { '' }
  let(:password) { '123' }
  let(:password_confirmation) { '123' }

  let(:params) do
    {
      user:
      {
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    }
  end

  context 'invalid email' do
    it 'should return 422' do
      post "/authentication/sign-up", params, request_headers

      expect(last_response).not_to be_successful
    end
  end

  context 'weak password' do
    let(:email) { 'john.doe@gmail.com' }

    it 'should return 422' do
      post "/authentication/sign-up", params, request_headers

      expect(last_response).not_to be_successful
    end

    context 'strong password but password_confirmation does not match' do
      let(:password) { 'a123123A!' }

      it 'should return 422' do
        post "/authentication/sign-up", params, request_headers

        expect(last_response).not_to be_successful
      end

      context 'all params are valid' do
        let(:first_name) { 'John' }
        let(:last_name) { 'Doe' }
        let(:password_confirmation) { 'a123123A!' }

        it 'should be a successful response' do
          post "/authentication/sign-up", params, request_headers

          expect(last_response).to be_successful
        end
      end
    end
  end

  # xit "should register a user successfully" do

  #   expect(last_response).to be_successful

  #   response_body = JSON.parse(last_response.body)
  # end
end
