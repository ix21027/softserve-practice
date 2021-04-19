class UsersController < ApplicationController
  
  def index
    pagy, users = pagy(User.sorted(params), items: 4)
    render json: {users: users, pagy: pagy_metadata(pagy)}
  end

  def show
    render json: {user: resource}
  end

  def create
    build_resource.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy! 
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
