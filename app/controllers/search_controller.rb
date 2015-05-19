class SearchController < ApplicationController

  #GET /search
  #GET /search.json

  def index
    @q = Subject.ransack(params[:q])
    page = params[:page]
    if request.post? || page
      @hits = @q.result.size
      @subject = @q.result.page(params[:page])
      respond_to do |format|
        format.html 
        format.json {render json:@subject}
      end
    end
  end
  
  def detail
    kcode = params[:kcode]
    @subject = Subject.where({'kcode'=>kcode})
  end

end
