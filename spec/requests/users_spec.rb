require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "GET /users" do
    get "/users"
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response.status).to eq(200)
    expect(response.body).to include('"users":')
  end

  it "POST /users" do
    post "/users"
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response.status).to eq(200)
    expect(response.body).to include('"user":')
  end

  it "DELETE /users" do
  	user = User.create fname: "name"
    delete "/users", params: {id: user.id}

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response.status).to eq(200)
    expect(response.body).to include('"id":')
  end

  it "PUT /users" do
  	user = User.create fname: "name"
    put "/users", params: {id: user.id}

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response.status).to eq(200)
    expect(response.body).to include('true')
  end
end