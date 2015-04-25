class SearchController < ApplicationController
  def index
  end

  def search
    @subject = Subject.first(3)#.where(id: '1')
  end

  def detail(kcode)
  end
end
