class PropositionsController < ApplicationController
  def index
    @proposition = Proposition.all
end
  def new
    @proposition = Proposition.new
  end

  def create
    @proposition = Proposition.new(proposition_params)
    @proposition.job_application_id = params[:job_application_id]
    #byebug
    if @proposition.save
      redirect_to job_application_propositions_path
    else
      render :new
    end
  end

  def show
    @proposition = Proposition.find(params[:id])
  end

  def accept
    @proposition = Proposition.find(params[:proposition_id])
    if @proposition.update(accepted: true)
      redirect_to root_path
    else
      render :index
    end
    
  end
  def reject
    @proposition = Proposition.find(params[:proposition_id])
    if @proposition.update(accepted: false)
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def proposition_params
      #byebug
      params.require(:proposition).permit(:message, :accepted)
    end
  end
