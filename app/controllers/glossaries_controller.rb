class GlossariesController < ApplicationController
  before_filter :authenticate_user!, :except => 'show'
  load_and_authorize_resource

  # GET /glossaries
  # GET /glossaries.json
  def index
    # @glossaries = Glossary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glossaries }
    end
  end

  # GET /glossaries/1
  # GET /glossaries/1.json
  def show
    # @glossary = Glossary.find(_params[:id])
    @glossary = Glossary.find_by_name(request.subdomains.first)
    @words = @glossary.all_words

    #if params[:l]
    #  @words = @words.find_all { |w| w.name.[0] == params[:l] }
    #end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glossary }
    end
  end

  # GET /glossaries/new
  # GET /glossaries/new.json
  def new
    # @glossary = Glossary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glossary }
    end
  end

  # GET /glossaries/1/edit
  def edit
    # @glossary = Glossary.find(params[:id])
    @words = Word.where(:user_id => current_user.id)
    @categories = Category.where(:user_id => current_user.id)
  end

  # POST /glossaries
  # POST /glossaries.json
  def create
    # @glossary = Glossary.new(params[:glossary])
    @glossary.user = current_user

    respond_to do |format|
      if @glossary.save
        format.html { redirect_to edit_glossary_url(@glossary), notice: 'Glossary was successfully created.' }
        format.json { render json: @glossary, status: :created, location: @glossary }
      else
        format.html { render action: "new" }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glossaries/1
  # PUT /glossaries/1.json
  def update
    # @glossary = Glossary.find(params[:id])
    @words = Word.where(:user_id => current_user.id)
    @categories = Category.where(:user_id => current_user.id)

    params[:glossary][:category_ids] ||= []
    params[:glossary][:word_ids] ||= []

    respond_to do |format|
      if @glossary.update_attributes(params[:glossary])
        format.html { redirect_to glossaries_url, notice: 'Glossary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glossaries/1
  # DELETE /glossaries/1.json
  def destroy
    # @glossary = Glossary.find(params[:id])
    @glossary.destroy

    respond_to do |format|
      format.html { redirect_to glossaries_url }
      format.json { head :no_content }
    end
  end
end
