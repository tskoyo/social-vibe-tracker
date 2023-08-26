# frozen_string_literal: true

RSpec.describe User::Serializers::User do
  let(:params) do
    { 
      first_name: 'John', 
      last_name: 'Doe', 
      email: 'john.doe@test.com', 
      password: 'pa$$w0rD', 
      password_confirmation: 'pa$$w0rD' 
    }
  end

  let(:expected_response) do
    {
      email: user.email,
      name: user.full_name
    }
  end

  subject { described_class.new(user) }

  context 'data serialization' do
    let(:user) { User::Slice['repositories.user'].create(params) }

    it 'should serialize user object properly' do
      expect(subject.as_hash).to eq(expected_response)
    end
  end
end