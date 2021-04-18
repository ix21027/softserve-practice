class UsersController < ApplicationController
  
  def show
    pagy, users = pagy(User.sorted(params), items: 4)
    render json: {users: users, pagy: pagy_metadata(pagy)}
  end

private
  def resource
    @user ||= User.find(params[:id])
  end

  def build_resource
    @user = User.new resource_params
  end

  def resource_params
    params.permit(:fname, :lname, :ysalary)
  end
end
