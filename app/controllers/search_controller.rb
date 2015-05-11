class SearchController < ApplicationController
  
  #GET /search
  #GET /search.json
  
  def index
    @search = Subject.search(params[:q])
  end
  
  def search
    @search = Subject.search(params[:q])
    @subject = @search.result(distinct: true)
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
