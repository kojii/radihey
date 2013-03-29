class DefaultButtonSetsController < ApplicationController
  layout "settings"
  # GET /button_sets
  # GET /button_sets.json
  def index
    @button_sets = ButtonSet.all

    respond_to do |format|
      format.html
      format.json { render json: @button_sets }
    end
  end

  # GET /button_sets/1
  # GET /button_sets/1.json
  def show
    @button_set = ButtonSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button_set }
    end
  end

  # GET /button_sets/new
  # GET /button_sets/new.json
  def new
    @button_set = params[:id] ? DefaultButtonSet.find(params[:id]).clone : DefaultButtonSet.new
    @button_set.name = nil

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @button_set }
    end
  end

  # GET /button_sets/1/edit
  def edit
    @button_set = DefaultButtonSet.find(params[:id])
  end

  # POST /button_sets
  # POST /button_sets.json
  def create
    @button_set = DefaultButtonSet.new(params[:default_button_set])
    params[:buttons].each do |btn|
      button = Button.create(btn)
      @button_set.buttons << button if button.valid?
    end

    respond_to do |format|
      if @button_set.save
        format.html { redirect_to default_button_sets_url, notice: 'Button set was successfully created.' }
        format.json { render json: @button_set, status: :created, location: @button_set }
      else
        format.html { render action: "new" }
        format.json { render json: @button_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /button_sets/1
  # PUT /button_sets/1.json
  def update
    @button_set = DefaultButtonSet.find(params[:id])
    params[:buttons].each do |btn|
      button = @button_set.buttons.where(:tag => btn[:tag]).first
      if button
        button.update_attributes btn
        button.destry unless button.valid?
      end
    end

    respond_to do |format|
      if @button_set.update_attributes(params[:default_button_set])
        format.html { redirect_to default_button_sets_url, notice: 'Button set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /button_sets/1
  # DELETE /button_sets/1.json
  def destroy
    @button_set = ButtonSet.find(params[:id])
    @button_set.destroy

    respond_to do |format|
      format.html { redirect_to button_sets_url }
      format.json { head :no_content }
    end
  end

  def upload
    audio = AudioFile.new(params["audio"])
    audio.save!
    render json: audio
  end

end
