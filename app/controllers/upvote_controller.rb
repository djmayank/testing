class UpvoteController < ApplicationController
  def toggle
  		@question = Question.find(params[:question_id].to_i)
		upvote = Upvote.where(user: current_user, question: @question).first
		if upvote
			upvote.destroy!
			@is_upvoted = false	
		else
			Upvote.create(user: current_user, question: @question)
			@is_upvoted = true
			if Downvote.where(user: current_user,question: @question).length>0
				Downvote.where(user: current_user,question: @question).first.destroy
			end
		end

		respond_to do |format|
			format.js {}
		end
  end
end