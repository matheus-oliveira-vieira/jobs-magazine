class JobsController < ApplicationController
  #before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def show
    @job_applied=JobApplication.find_by(user: current_user, job: @job)
    @job = Job.find(params[:id])
  end

  def new
    @jobs = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.company_id = current_user.company_id
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
    @jobs = Job.find(params[:id])
  end

  def update
    @jobs = Job.find(params[:id])

    if @jobs.update(job_params)
      redirect_to @jobs
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to root_path
  end
  
  def search
    @jobs = Job.where('name like ? OR description like ?',
      "%#{params[:q]}%", "%#{params[:q]}%")
  end

  def status
    @job = Job.find(params[:id])
    @job.update(active: !@job.active)
    redirect_to @job
  end

  def all_applications
    @jobs = JobApplication.where("job_id like ?", "%#{params[:job_id]}%")
    #byebug
  end

  private
    def job_params
      params.require(:job).permit(:name, :description, :salary, :level, :requirements, :expiration_date, :qty_candidates, :company_id, :active)
    end
end