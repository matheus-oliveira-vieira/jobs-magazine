class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @companies = Company.new
  end

  def create
    
    @company = Company.new(company_params)
    #@company.user = current_user
    if @company.save
      current_user.update(company: @company)
      redirect_to @company
    else
      render :new
    end
  end

  private
    def company_params
      params.require(:company).permit(:name, :address, :cnpj, :website, :founded, :logo)
    end
end
