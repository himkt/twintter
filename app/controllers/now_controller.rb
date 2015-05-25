class NowController < ApplicationController
  def index
    @posts = Now.all.order("created_at desc").page(params[:page])
  end

  def selected_index
    @post = Now.new
    @subject_kcode = params['subject_kcode']
    @subject = Subject.where("kcode = ?",@subject_kcode)
    @posts = Now.where("subject_kcode = ? and deleted = ?",@subject_kcode,0).order("created_at desc").page(params[:page])
    tweet = params["now"]["text"] if params["now"]
    if tweet
      update(tweet, @subject_kcode)
    end
  end
  
  def update(tweet,subject_kcode='0')
    if subject_kcode != '0'
      Now.create(:subject_kcode=>subject_kcode, :text=>tweet ,:deleted=>0)
      # postしたデータを含むツイート一覧をデータベースから取得する
      # @posts = Now.where("subject_kcode = ? and deleted = ?",@subject_kcode,0).order("created_at desc").page(params[:page])
      render action: :selected_index
    end
  end
  
  def delete(id=nil)
    @now = Now.find(params[:id])
    # @update = @now.update(deleted = True)
  end
  def favorite(id=nil)
  end
end
