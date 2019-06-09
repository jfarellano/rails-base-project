class UsersController < ApplicationController
  skip_before_action :get_current_user, only: [:create, :index]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :is_current_user_admin, only: [:update, :destroy]

  def index 
    render_ok User.all
  end

  def show
    if @current_user.id == @user.id
     render_ok @current_user
     #render json: {user: @current_user, picture: url_for(@current_user.avatar)}, status: :ok 
    else 
      render_ok @user if is_current_user_admin.nil?
    end
  end

  def create
    user = User.new user_params
    save_and_render user
  end

  def self_update
    @current_user.update_attributes user_params 
    save_and_render @current_user
  end

  def update 
    @user.update_attributes user_params 
    save_and_render @user
  end

  def destroy
    render_ok @user.destroy  
  end

  private 
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.permit(
      :email,
      :password,
      :username,
      :avatar
    )
  end
end