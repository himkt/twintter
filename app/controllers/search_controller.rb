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
    id = params[:id]
    
    #    @subject = Subject.where({'id'=>id})
    @subject = Subject.find(kcode: params[:kcode])
    
  end

end
