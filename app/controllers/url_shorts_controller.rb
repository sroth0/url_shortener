class UrlShortsController < ApplicationController
  def index
   @url_shorts = UrlShort.all
  end

  def show
   @url_short = UrlShort.find(params[:id])
   redirect_to @url_short.long_url
  end

  def new
   @url_short = UrlShort.new
  end

  def create
   @url_short = UrlShort.new(set_url_short)
   @url_short.short_url = SecureRandom.urlsafe_base64(4)
   @url_short.save!
   redirect_to url_shorts_path
  end

  private
  def set_url_short
    params.require(:url_short).permit(:long_url)
  end
end
