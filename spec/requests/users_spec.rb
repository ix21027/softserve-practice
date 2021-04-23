require 'swagger_helper'

describe "Users", type: :request do
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


describe 'Users API' do

  path '/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          fname: { type: :string },
          lname: { type: :string },
          ysalary: { type: :integer }
        },
        required: [ 'fname', 'lname', 'ysalary' ]
      }

      response '201', 'user created' do
        let(:user) { { fname: 'foo', lname: 'bar', ysalary: 111 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { fname: 'foo' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do

    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            fname: { type: :string },
            lname: { type: :string },
            ysalary: { type: :integer }
          },
          required: [ 'id', 'fname', 'lname', 'ysalary' ]

        let(:id) { User.create(fname: 'foo', lname: 'bar', ysalary: 111).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end