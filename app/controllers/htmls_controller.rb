require 'open-uri'
class HtmlsController < ApplicationController
  def new
    @html = Html.new
  end

  def create
    @html = Html.new(strong_params)
    # render api method to store html-data from Yahoo! to html-model.
    api(@html.code)
    if @html.save
      redirect_to new_html_path, :flash => { :notice => "You entered #{@html.code}, and the data is saved!" }
    else
      redirect_to new_html_path, :flash => { :alert => "Something broken, make sure you entered 4 digits." }
    end
  end

  protected
  def strong_params
    params.require(:html).permit(:code, :content)
  end

  def api(code)
    url = "https://stocks.finance.yahoo.co.jp/stocks/detail/?code=#{code}"
    open(url) do |a|
      @html.content = a.read
    end
  end
end
