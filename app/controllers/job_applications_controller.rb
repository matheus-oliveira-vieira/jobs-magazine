class JobApplicationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @job_applications = JobApplication.all
    end

    def show
        @job_applications = JobApplication.find(params[:id])
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

  end