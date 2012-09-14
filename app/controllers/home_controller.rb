class HomeController < ApplicationController
  def index
    if request.subdomains.first && request.subdomains.first != 'www'
      @glossary = Glossary.find_by_name(request.subdomains.first)
    end

    unless @glossary.nil?
      @words = @glossary.all_words
      @words = @words.find_all { |w| w.name[0] == params[:l] } if params[:l]
      render 'glossaries/show'
    else
      redirect_to words_url if user_signed_in?
    end

  end
end
