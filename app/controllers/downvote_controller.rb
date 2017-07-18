class DownvoteController < ApplicationController
  def toggle
  		@question = Question.find(params[:question_id].to_i)
		downvote = Downvote.where(user: current_user, question: @question).first
		if downvote
			downvote.destroy!
			@is_downvoted = false
		else
			Downvote.create(user: current_user, question: @question)
			@is_downvoted = true
			if Upvote.where(user: current_user,question: @question).length>0
				Upvote.where(user: current_user,question: @question).first.destroy
			end
		end

		respond_to do |format|
			format.js {}
		end
  end
end
