class SearchController < ApplicationController
  def index
    @subject = Subject.where(id: '1')
  end

  def search
  end

  def detail
  end
end
