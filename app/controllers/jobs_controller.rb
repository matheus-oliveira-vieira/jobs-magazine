class JobsController < ApplicationController
  #before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def show
    @jobs = Job.find(params[:id])
  end

  def new
    @jobs = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
    @jobs = Job.find(params[:id])
  end
  
  private
    def job_params
      params.require(:job).permit(:name, :description, :salary, :level, :requirements, :expiration_date, :qty_candidates, :company_id)
    end
end