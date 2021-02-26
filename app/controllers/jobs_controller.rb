class JobsController < ApplicationController
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
  
  private
    def job_params
      params.require(:job).permit(:name, :description, :salary, :level, :requirements, :expiration_date, :qty_candidates)
    end
end