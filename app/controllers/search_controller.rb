class SearchController < ApplicationController
  def index
    @subjects = Subject.new
  end

  def search
    @subject = Subject.first(3)#.where(id: '1')
  end

  def detail(kcode)
  end
end
