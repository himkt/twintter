class SearchController < ApplicationController

  #GET /search
  #GET /search.json

  def index
    @q = Subject.ransack(params[:q])
    @flag = params[:q] ? false : true
    @page = params[:page] ? params[:page] : '1'
    @hits = @q.result.size
    @subject = @q.result.page(params[:page])
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
