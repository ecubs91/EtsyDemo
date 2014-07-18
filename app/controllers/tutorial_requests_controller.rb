class TutorialRequestsController < ApplicationController
  before_action :set_tutorial_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def sales
    @tutorial_requests = TutorialRequest.all.where(tutor: current_user).tutorial_request("created_at DESC")
  end

  def purchases
    @tutorial_requests = TutorialRequest.all.where(student: current_user).tutorial_request("created_at DESC")
  end


  # GET /tutorial_requests
  # GET /tutorial_requests.json
  def index
    @tutorial_requests = TutorialRequest.all
  end

  # GET /tutorial_requests/1
  # GET /tutorial_requests/1.json
  def show
  end

  # GET /tutorial_requests/new
  def new
    @tutorial_request = TutorialRequest.new
    @listing = Listing.find(params[:listing_id])
  end

  # GET /tutorial_requests/1/edit
  def edit
  end

  # POST /tutorial_requests
  # POST /tutorial_requests.json
  def create
    @tutorial_request = TutorialRequest.new(tutorial_request_params)
    @listing = Listing.find(params[:listing_id])
    @tutor = @listing.user

    @tutorial_request.listing_id = @listing.id
    @tutorial_request.student_id = current_user.id
    @tutorial_request.tutor_id = @tutor.id
    respond_to do |format|
      if @tutorial_request.save
        format.html { redirect_to root_url, notice: 'Tutorial request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tutorial_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @tutorial_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorial_requests/1
  # PATCH/PUT /tutorial_requests/1.json
  def update
    respond_to do |format|
      if @tutorial_request.update(tutorial_request_params)
        format.html { redirect_to @tutorial_request, notice: 'Tutorial request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tutorial_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_requests/1
  # DELETE /tutorial_requests/1.json
  def destroy
    @tutorial_request.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial_request
      @tutorial_request = TutorialRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_request_params
      params.require(:tutorial_request).permit(:subject, :level, :duration)
    end
end


