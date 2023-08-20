# frozen_string_literal: true

require 'pry'

RSpec.describe User::Actions::Create do
  let(:email) { 'johndoe.com' }
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:password) { 'pa44$w0rd' }
  let(:password_confirmation) { 'pa44$w0rd' }

  let(:params) do
    { user: { email: email, first_name: first_name, last_name: last_name } }
  end

  describe 'user creation' do
    context 'invalid email' do
      it 'should not be successful' do
        response = subject.call(params)
        expect(response).not_to be_successful
      end
    end

    # xit 'should be successful' do
    #   response = subject.call({user})
    #   expect(response).to be_successful
    # end
  end
end
