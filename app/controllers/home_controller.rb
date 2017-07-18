class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@question = Question.new
  	@question_feed = Question.all.order(created_at: :desc); 
  	@answer = Answer.new
  	@answer_feed = Answer.all.order(created_at: :desc);
  end


def ajax
	render :json => {text: "text"}
end


end
