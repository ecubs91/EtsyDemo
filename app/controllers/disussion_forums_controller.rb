class DisussionForumsController < ApplicationController
  before_action :set_disussion_forum, only: [:show, :edit, :update, :destroy]

  # GET /disussion_forums
  # GET /disussion_forums.json
  def index
    @disussion_forums = DisussionForum.all
  end

  # GET /disussion_forums/1
  # GET /disussion_forums/1.json
  def show  
    @disussion = DisussionForum.find(1)
    #@user_who_commented = current_user
    #@comment = Comment.build_from( @disussion, @user_who_commented.id, "This is a testing comment 2" )
    #@comment.save
    #@comment.move_to_child_of(Comment.first)

    @all_comments = @disussion.comment_threads
    @root_comments = @disussion.root_comments
  end

  def create_disussion_forum_comment
  end

  # GET /disussion_forums/new
  def new
    @disussion_forum = DisussionForum.new
  end

  # GET /disussion_forums/1/edit
  def edit
  end

  # POST /disussion_forums
  # POST /disussion_forums.json
  def create
    @disussion_forum = DisussionForum.new(disussion_forum_params)

    respond_to do |format|
      if @disussion_forum.save
        format.html { redirect_to @disussion_forum, notice: 'Disussion forum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @disussion_forum }
      else
        format.html { render action: 'new' }
        format.json { render json: @disussion_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disussion_forums/1
  # PATCH/PUT /disussion_forums/1.json
  def update
    respond_to do |format|
      if @disussion_forum.update(disussion_forum_params)
        format.html { redirect_to @disussion_forum, notice: 'Disussion forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @disussion_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disussion_forums/1
  # DELETE /disussion_forums/1.json
  def destroy
    @disussion_forum.destroy
    respond_to do |format|
      format.html { redirect_to disussion_forums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disussion_forum
      @disussion_forum = DisussionForum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disussion_forum_params
      params.require(:disussion_forum).permit(:subject, :question, :details)
    end
end
