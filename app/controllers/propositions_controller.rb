class PropositionsController < ApplicationController
  def index
    @proposition = Propositions.all
end
  def new
    @proposition = Propositions.new
  end

  def create
    @proposition = Propositions.new(proposition_params)
    if @proposition.save
      redirect_to propositions_path
    else
      render :new
    end
  end

  def show
    @proposition = Propositions.find(params[:id])
  end
  private
    def proposition_params
      params.require(:proposition).permit(:message)
    end
  end
end