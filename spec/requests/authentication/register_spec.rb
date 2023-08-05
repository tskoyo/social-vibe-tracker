# frozen_string_literal: true

RSpec.describe "POST /authentication/sign-up", type: :request do
  it "should register a user successfully" do
    post "/authentication/sign-up"

    expect(last_response).to be_successful

    response_body = JSON.parse(last_response.body)

    expect(response_body).to eq([
      { "title" => "Test Driven Development" },
      { "title" => "Practical Object-Oriented Design in Ruby" }
    ])
  end
end
