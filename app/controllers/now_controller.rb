class NowController < ApplicationController
  def index
    @post = Now.new
    @posts = Now.all.reverse
    param = params
    tweet = param["now"]["text"] if param["now"]
    subject_kcode = 0
    if tweet
      update(tweet, subject_kcode)
    end
  end

  def brows(subject_kcode)
    
  end
  
	def update(tweet,subject_kcode='0')
    if subject_kcode != '0'
      Now.create(:subject_kcode=>subject_kcode, :text=>tweet)
      render action: :index
    end
	end

	def delete(id=nil)
	end

	def favorite(id=nil)
	end
end
