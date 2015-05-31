class SearchController < ApplicationController

  #GET /search
  #GET /search.json

  def index

    # クエリを取得
    @q = Subject.ransack(params[:q])
    
    # 検索画面を表示するか検索結果画面を表示するかのフラグ
    @flag = params[:q] ? false : true

    # ページ数
    @page ||= '1'

    # ヒット件数
    @hits = @q.result.size

    # 検索結果(ページネーション付き)
    @subject = @q.result.page(params[:page])

    # レスポンス
    respond_to do |format|
      format.html 
      format.json {render json:@subject}
    end
  end

  def detail
    
    # 科目番号
    kcode = params[:kcode]

    # 科目情報を取得
    @subject = Subject.where({'kcode'=>kcode})

    @tasks = []
    @cancels = []

    Now.where({'subject_kcode'=>kcode, 'deleted'=>0}).first(100).each do |now|
      @now = now['text']

      # 課題情報を抽出
      if item = now['text'].match(/課題は(.*)(?:です|だ|ら|か|\.|。)/)
        @tasks.push(item[1])
      end

      # 休講情報を抽出
      if now['text'].match(/(次回|来週)は?(休講)/)
        @cancels.push(now['created_at'])
      end
    end

  end

end
