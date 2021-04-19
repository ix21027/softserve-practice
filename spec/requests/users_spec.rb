require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "GET /users" do
    get "/users"
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response.status).to eq(200)
    expect(response.body).to include('"users":')
  end

  it "DELETE /users with not found status" do
    not_existed_user_id = -1
    delete "/users/#{not_existed_user_id}"
    expect(response.status).to eq(404)
  end

end
