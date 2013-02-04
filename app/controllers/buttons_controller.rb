class ButtonsController < ApplicationController
  def index
    @buttons = Button.all
  end

  def show
    @button = Button.find(params[:id])
  end

  def new
    @button = Button.new
  end

  def create
    @button = Button.new(params[:button])
    if @button.save
      redirect_to buttons_path
    else
      render :new
    end
  end

  def edit
    @button = Button.find(params[:id])
  end

  def update
    @button = Button.find(params[:id])
    if @button.update_attributes(params[:button])
      redirect_to button_path(@button.id)
    else
      render :edit
    end
  end

  def destroy
    @button = Button.find(params[:id])
    @button.destroy
    redirect_to buttons_path
  end
end
