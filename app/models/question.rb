class Question < ActiveRecord::Base
  belongs_to :user
  validates :content , presence:true , length: {maximum:1000}
  has_many :answers
  has_many :upvotes



  def upvoted user_id
  	Upvote.where(user_id: user_id,question_id: id).length>0
  end

  def downvoted user_id
  	Downvote.where(user_id: user_id,question_id: id).length>0
  end
end








