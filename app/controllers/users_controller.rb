class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end

  def update

  end

  def delete
  end

  def destroy

  end

  private
    # before action for show, edit, update, and destroy
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # TBD
    end

end
