class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @jobs = Job.find(params[:id])
  end
  
end