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
    kcode = params[:kcode]
    @subject = Subject.where({'kcode'=>kcode})
  end

end
