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
      sum = 0
      nm = Natto::MeCab.new
      nm.parse(tweet).split(/\n/).each do |line|
        elem = line.split(/\t/)
        break if elem[0] == 'EOS' 
        word = (elem[1].split(/\,/)[6] == '*') ? elem[0].stem : elem[1].split(/\,/)[6]
        value = Model.where("word = '#{word}'")[0]
        sum += value.value if value
      end
      e = Math.exp(1)
      score = (e ** sum - e** (-1 * sum)) / (e ** sum + e** (-1 * sum))
      @score = score
      update(tweet,@subject_kcode,score)
    end
  end
  
  def update(tweet,subject_kcode,score)
    if subject_kcode != '0'
      Now.create(:subject_kcode=>subject_kcode, :text=>tweet ,:deleted=>0,:score=>score)
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
