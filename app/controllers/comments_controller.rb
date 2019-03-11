class CommentsController < ApplicationController
  before_action :set_comment, only: [:new, :edit, :update, :destroy]

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
    @event = Event.find(params[:id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event, notice: 'Comment was successfully edited.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
      # format.js
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.event = @event
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @event = Event.find(params[:id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(event_params)
        format.html { redirect_to @event, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:event][:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:review, :content, :user_id, :event_id, :datetime)
    end
end
