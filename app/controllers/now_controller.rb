class NowController < ApplicationController
  def index
    @posts = Now.all.order("created_at desc").page(params[:page])
  end

  def selected_index
    
    # 選択した科目の科目番号を取得
    @subject_kcode = params['subject_kcode']

    # 検索
    @subject = Subject.where("kcode = ?",@subject_kcode)
    
    # 選択した科目に関するNowっを取得
    @post = Now.new
    @posts = Now.where("subject_kcode = ? and deleted = ?",@subject_kcode,0).order("created_at desc").page(params[:page])
    
    # ツイートをする
    tweet = params["now"]["text"] if params["now"]
    
    # ツイートが存在する場合
    if tweet
      
      # ポジネガスコアを計算する(https://github.com/himkt/judge_pos_neg)
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

      # ツイートをDBに保存
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
