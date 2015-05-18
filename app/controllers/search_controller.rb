class SearchController < ApplicationController
 
  #GET /search
  #GET /search.json
  
  def index
    @subject = Subject.ransack(params[:q])
  end
  
  def search
    @subject = Subject.ransack(params[:q]).result
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
