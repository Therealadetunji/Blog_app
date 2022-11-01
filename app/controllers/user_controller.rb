class UsersController < ApplicationController
  def index; end

  def show
    @users = Users.new(params[:id])
  end
end
