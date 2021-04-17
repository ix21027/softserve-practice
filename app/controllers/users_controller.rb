class UsersController < ApplicationController
  def show
    pagy, users = pagy(User.sorted(params), items: 2)
    render json: {users: users, pagy: pagy_metadata(pagy)}
  end

  def create
    render json: {user: User.create!(user_params)}
  end

  def update
    render json: User.find(params[:id]).update!(user_params)
  end

  def destroy
    render json: User.find(params[:id]).destroy!
  end

private
  def user_params
    params.permit(:fname, :lname, :ysalary)
  end
end
