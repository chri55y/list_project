class ListItemsController < ApplicationController
=begin  ############################################

  CH 2018.2.9
        used commas instead of spaces between views when generateing controller

=end    ############################################

  def index
    @list_items = ListItem.all
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
end
