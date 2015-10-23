class SurveysController < ApplicationController
  respond_to :html, :js #Potential for creating a Surveys API 

  def index
    @kinds = Kind.all()

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new 
    @survey = Survey.new()
    @data = File.read("public/assets/follow_ups.json") # Users can only take one survey, for now. 
  end

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


  private

  def survey_params
    params.require(:survey).permit(:questions, :answers, :kind_id)
  end
end
