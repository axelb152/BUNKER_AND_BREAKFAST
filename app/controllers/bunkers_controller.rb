class BunkersController < ApplicationController
  def index
  end

  def new
  end

  def show
    @bunker = Bunker.find(params[:id])

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
