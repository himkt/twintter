class NowController < ApplicationController
  def index
    @posts = Now.all.reverse
    # @posts = Now.where("subject_kcode = ?",@subject_kcode)
  end

  def selected_index
    @post = Now.new
    @subject_kcode = params['subject_kcode']
    @posts = Now.where("subject_kcode = ?",@subject_kcode)
    tweet = params["now"]["text"] if params["now"]
    if tweet
      update(tweet, @subject_kcode)
    end
  end
  
  def update(tweet,subject_kcode='0')
    if subject_kcode != '0'
      Now.create(:subject_kcode=>subject_kcode, :text=>tweet ,:deleteflag=>false)
      render action: :index
    end
  end
  
  def delete(id=nil)
    @now = Now.find(params[:id])
    @update = @now.updata(deleteflag = True)
  end
  def favorite(id=nil)
  end
end
