class NowController < ApplicationController
  def index
    @posts = [{'user'=>'matsu', 'text' => 'this is test'}, {'user'=>'hira', 'text'=>'test'}, {'user'=>'matsu', 'text'=>'<script>alert();</script><br>'}, {'user'=>'hira', 'text'=>'<script>alert();</script>'}]
  end
  
	def post
    text = @text
    render text
	end

	def delete(id=nil)
	end

	def favorite(id=nil)
	end
end
