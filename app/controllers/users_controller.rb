class UsersController < ApplicationController
  def show
    render json: User.sorted(params)
  end

  def create
    User.create!(user_params)
  end

  def update
    User.find(params[:id]).update!(user_params)
  end

  def destroy
    User.find(params[:id]).destroy!
  end

private
  def user_params
    params.permit(:fname, :lname, :ysalary)
  end
end
