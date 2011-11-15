class MarkersController < ApplicationController
  # GET /markers
  # GET /markers.json
  def index
    @markers = Marker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @markers }
    end
  end

  # GET /markers/1
  # GET /markers/1.json
  def show
    @marker = Marker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marker }
    end
  end

  # GET /markers/new
  # GET /markers/new.json
  def new
    @marker = Marker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marker }
    end
  end

  # GET /markers/1/edit
  def edit
    @marker = Marker.find(params[:id])
  end

  # POST /markers
  # POST /markers.json
  def create
    @marker = Marker.new(params[:marker])

    respond_to do |format|
      if @marker.save
        format.html { redirect_to @marker, notice: 'Marker was successfully created.' }
        format.json { render json: @marker, status: :created, location: @marker }
      else
        format.html { render action: "new" }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /markers/1
  # PUT /markers/1.json
  def update
    @marker = Marker.find(params[:id])

    respond_to do |format|
      if @marker.update_attributes(params[:marker])
        format.html { redirect_to @marker, notice: 'Marker was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markers/1
  # DELETE /markers/1.json
  def destroy
    @marker = Marker.find(params[:id])
    @marker.destroy

    respond_to do |format|
      format.html { redirect_to markers_url }
      format.json { head :ok }
    end
  end
end
