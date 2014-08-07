class TutorialRequestsController < ApplicationController
  before_action :set_tutorial_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]



  def sales
    @tutorial_requests = TutorialRequest.all.where(tutor: current_user).order("created_at DESC")
  end

  def purchases
    @tutorial_requests = TutorialRequest.all.where(student: current_user).order("created_at DESC")
  end

  # GET /tutorial_requests
  # GET /tutorial_requests.json
  def index
    @tutorial_requests = TutorialRequest.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tutorial_requests/1
  # GET /tutorial_requests/1.json
  def show
  end

  # GET /tutorial_requests/new
  def new
    @tutorial_request = TutorialRequest.new
  end

  # GET /tutorial_requests/1/edit
  def edit
  end

  # POST /tutorial_requests
  # POST /tutorial_requests.json
  def create
    @tutorial_request = TutorialRequest.new(tutorial_request_params)
    @tutorial_request.user_id = current_user.id

    @listing = Listing.find(params[:listing_id])
    @tutor = @listing.user
    

    @tutorial_request.listing_id = @listing.id
    @tutorial_request.student_id = current_user.id
    @tutorial_request.tutor_id = @tutor.id

    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => (@listing.price * 100).floor,
        :currency => "usd",
        :card => token
        )
      flash[:notice] = "Thanks for ordering!"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end

    TutorialRequestMailer.tutorial_request_confirmation(@user).deliver

    respond_to do |format|
      if @tutorial_request.save
        format.html { redirect_to root_url }
        format.json { render action: 'show', status: :created, location: @tutorial_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @tutorial_request.errors, status: :unprocessable_entity }
      end
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

    def check_user
      if current_user != @tutorial_request.user
        redirect_to root_url, alert: "Sorry this profile belongs to someone else"
      end
    end
end


