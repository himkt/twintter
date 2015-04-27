class NowController < ApplicationController
  def index
    @post = Now.new
    @posts = Now.all
    param = params
    tweet = param["now"]["text"] if param["now"]
    subject_kcode = 0
    if tweet
      update(tweet, subject_kcode)
    end
  end
  
	def update(tweet,subject_kcode='0')
    Now.create(:subject_kcode=>subject_kcode, :text=>tweet)
    render action: :index
	end

	def delete(id=nil)
	end

	def favorite(id=nil)
	end
end
