# frozen_string_literal: true

RSpec.describe User::Actions::Users::Create do
  let(:email) { 'johndoe@test.com' }
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:password) { 'pa44$w0rD' }
  let(:password_confirmation) { 'pa44$w0rD' }

  let(:params) do
    { user: { email:, first_name:, last_name:, password:, password_confirmation: } }
  end

  describe 'user creation' do
    context 'when email is invalid' do
      let(:email) { 'johndoe' }
      it 'should not be successful' do
        response = subject.call(params)
        expect(response).not_to be_successful
      end
    end

    context 'when first_name is empty' do
      let(:first_name) { nil }

      it 'should not be successful' do
        response = subject.call(params)
        expect(response).not_to be_successful
      end
    end

    context 'when password is weak' do
      let(:password) { '123' }
      let(:password_confirmation) { '123' }

      it 'should not be successful' do
        response = subject.call(params)
        expect(response).not_to be_successful
      end
    end

    context 'when password confirmation does not match' do
      let(:password_confirmation) { 'password'}

      it 'should not be successful' do
        response = subject.call(params)
        expect(response).not_to be_successful
      end
    end

    context 'when all params are valid' do
      it 'should return successful response' do
        response = subject.call(params)
        expect(response).to be_successful
      end
    end
  end
end
