class UrlGeneratorsController < ApplicationController
	def index
	end
	def create 
		@url = UrlGenerator.new(urlparams)
		@url.user_id = current_user.id;
		@url.count = 0;
		if @url.save
			redirect_to url_generators_path
		end
	end
	def show
		@url = UrlGenerator.find_by(encoded_url:params[:encoded_url])
		@url.count += 1
		@url.update_attributes(count: @url.count)
	end
	private
	def urlparams
		params[:url_generator].permit(:url,:user_id,:encoded_url,:count)
	end
end
