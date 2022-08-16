class UsersController < ApplicationController

  def index
    users = User.all
    render json: users.as_json
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user.as_json
  end

  def create
    user = User.new
    user.name = params[:name]
    user.subscriber = params[:subscriber]
    user.save
    render json: user.as_json

  end

  def update
    user = User.find_by(id: params[:id])
    user.name = params[:name] || user.name
    user.subscriber = params[:subscriber] || user.subscriber
    user.save
    render json: user.as_json
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: {message: "User destroyed"}


  end

end
