class ButtonImagesController < ApplicationController
  # GET /button_images
  # GET /button_images.json
  def index
    @button_images = ButtonImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @button_images }
    end
  end

  # GET /button_images/1
  # GET /button_images/1.json
  def show
    @button_image = ButtonImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_image }
    end
  end

  # GET /button_images/new
  # GET /button_images/new.json
  def new
    @button_image = ButtonImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_image }
    end
  end

  # GET /button_images/1/edit
  def edit
    @button_image = ButtonImage.find(params[:id])
  end

  # POST /button_images
  # POST /button_images.json
  def create
    @button_image = ButtonImage.new(params[:button_image])
    if @button_image.save
      #render "success"
      render partial: "default_button_sets/image_gallery"
    else
      render "fail"
    end
  end

  # PUT /button_images/1
  # PUT /button_images/1.json
  def update
    @button_image = ButtonImage.find(params[:id])

    respond_to do |format|
      if @button_image.update_attributes(params[:button_image])
        format.html { redirect_to @button_image, notice: 'Button image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_images/1
  # DELETE /button_images/1.json
  def destroy
    @button_image = ButtonImage.find(params[:id])
    @button_image.destroy

    respond_to do |format|
      format.html { redirect_to button_images_url }
      format.json { head :no_content }
    end
  end
end
