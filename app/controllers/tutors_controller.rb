class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  # GET /tutors
  # GET /tutors.json
  def index
    @tutors = Tutor.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tutors/1
  # GET /tutors/1.json
  def show
     @reviews = Review.where(tutor_id: @tutor.id).order("created_at DESC")
    if @reviews.blank?
      avg_rating = 0 
    else
      @avg_rating = @tutor.average(:rating).round(2) 
    end
  end

  # GET /tutors/new
  def new
    @tutor = Tutor.new
  end

  # GET /tutors/1/edit
  def edit
  end

  # POST /tutors
  # POST /tutors.json
  def create
    @tutor = Tutor.new(tutor_params)

  @tutor.user_id = current_user.id
   
    respond_to do |format|
      if @tutor.save
        format.html { redirect_to @tutor, notice: 'Tutor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tutor }
      else
        format.html { render action: 'new' }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to @tutor, notice: 'Tutor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @tutor.destroy
    respond_to do |format|
      format.html { redirect_to tutors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor
      @tutor = Tutor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_params
      params.require(:tutor).permit(:university, :degree_subject, :teaching_subject, :location, :tutorial_type, :string, :about_myself, :tutoring_approach, :teaching_expexperience, :extracurricular_interests)
    end
    
    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry this profile belongs to someone else"
      end
    end
end
