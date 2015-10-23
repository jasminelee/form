class SurveysController < ApplicationController
  respond_to :html, :js

  def index #different surveys you can take
    @kinds = Kind.all()

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new 
    @survey = Survey.new()
    @data = File.read("public/assets/follow_ups.json")
#    render :json => @data
  end

  #TODO: figure out how to select a kind
  def create
    @survey = Survey.new(survey_params)
    @survey.user_id = current_user.id

    if @survey.save
      redirect_to surveys_url
    else
      Rails.logger.info(@survey.errors.inspect)
      render :action => "new"
    end
  end

  def edit
  end

  def show
    @survey = Survey.find(params[:id])
#    redirect_to survey_url(@survey)
  end

  def update
  end

  def destroy
  end

  private

  def survey_params
    params.require(:survey).permit(:questions, :answers, :kind_id)
  end
end
