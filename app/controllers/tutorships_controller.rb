class TutorshipsController < ApplicationController
  before_action :set_tutorship, only: [:show, :edit, :update, :destroy]

  def tutor
    @tutorship = Tutorship.all.
  end
  
  def student
  end
  
  # GET /tutorships
  # GET /tutorships.json
  def index
    @tutorships = Tutorship.all
  end

  # GET /tutorships/1
  # GET /tutorships/1.json
  def show
  end

  # GET /tutorships/new
  #def new
    #@tutorship = Tutorship.new
  #end

  # GET /tutorships/1/edit
  def edit
  end

  # POST /tutorships
  # POST /tutorships.json
  def create
    # logger.debug("params: #{params.inspect}")
    @tutorship = Tutorship.new(tutorship_params)
    @tutorship.student_id = current_user
    @tutorship.tutor_id = params[:tutor_id]
    @tutorship.accepted = true
    @tutorship.tutor_id.pending_invite_to_be_a_tutor
    respond_to do |format|
      if @tutorship.save
        format.html { redirect_to @tutorship, notice: 'Tutorship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tutorship }
      else
        format.html { render action: 'new' }
        format.json { render json: @tutorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorships/1
  # PATCH/PUT /tutorships/1.json
  def update
    respond_to do |format|
      if @tutorship.update(tutorship_params)
        format.html { redirect_to @tutorship, notice: 'Tutorship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tutorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorships/1
  # DELETE /tutorships/1.json
  def destroy
    @tutorship.destroy
    respond_to do |format|
      format.html { redirect_to tutorships_url }
      format.json { head :no_content }
    end
  end


  
private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorship
      @tutorship = Tutorship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorship_params
      params.require(:tutorship).permit(:tutor_id, :student_id, :subject_id, :accepted, :starting_date, :duration)
    end
end
