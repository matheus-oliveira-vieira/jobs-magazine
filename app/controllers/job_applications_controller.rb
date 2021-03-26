class JobApplicationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @job_applications = JobApplication.all
    end

    def show
        @job_application = JobApplication.find(params[:id])
        @user = User.find_by(id: @job_application.user_id)
    end

    def new
        @job_applications = JobApplication.new
    end

    def create
    	@job_applications = JobApplication.new
    	@job_applications.user_id = current_user.id
    	@job_applications.job_id = params[:job]
    	@job_applications.status = JobApplication.statuses['pendente de avaliação']
    	#byebug
    	if @job_applications.save
        redirect_to job_applications_path
    	else
        redirect_to root_path
    	end
    end

    def decide
			byebug
    	@job_application = JobApplication.update(job_application_params)
	    redirect_to job_all_applications_path
    end

		private
    def job_application_params
      params.require(:job_application).permit(:job_id, :user_id, :status, :message)
    end
  end