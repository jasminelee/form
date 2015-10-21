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

    puts "FUUUUCK"
    puts @survey.kind_id
#    kind = build(kind: params[:kind])

  #    @survey.kind = Kind.find(params[:kind_id])
    #TODO: i have no idea what's going on
    # variable name shouldn't be @kind 
#    @kind = current_user.surveys.build(questions: "fsdf") # breaks without the questions option
    # @survey.questions = @kind.questions

#    questions = current_user.surveys.build(questions: params[:questions]) # breaks without the questions option
#    @survey.answers = params[:answers].to_json
    
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
