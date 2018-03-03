class ListUsersController < ApplicationController
  before_action :set_list_user, only: [:show, :edit, :update, :destroy]

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
  def set_list_user
    @list_user = ListUser.find(params[:id])
  end


  
end
