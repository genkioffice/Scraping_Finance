require 'open-uri'
class HtmlsController < ApplicationController
  def new
    @html = Html.new
  end

  def create
    @html = Html.new(strong_params)
    api(@html.code)
    if @html.save
      redirect_to new_html_path
    else
      redirect_to new_html_path
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
