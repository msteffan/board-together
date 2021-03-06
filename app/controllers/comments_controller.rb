class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    #overriding the commenter field
    @comment[:commenter] = current_user.email
    @comment.save
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    if current_user.email == @comment.commenter
      @comment.destroy
      redirect_to event_path(@event)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
