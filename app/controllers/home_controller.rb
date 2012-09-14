class HomeController < ApplicationController
  def index
    if request.subdomains.first && request.subdomains.first != 'www'
      @glossary = Glossary.find_by_name(request.subdomains.first)
    end

    unless @glossary.nil?
      render 'glossaries/show'
    end

    redirect_to words_url if user_signed_in?
  end
end
