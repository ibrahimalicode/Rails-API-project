# app/controllers/api/users_controller.rb
class Api::UsersController < ApplicationController
  # GET /api/users
  def index
    users = User.all
    render json: users
  end

  # GET /api/users/:id
  def show
    user = User.find(params[:id])
    render json: user
  end

  # POST /api/users
  def create
    user = User.create!(user_params)
    render json: user
  end

  # PUT /api/users/:id
  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  # DELETE /api/users/:id
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "User deleted" }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
