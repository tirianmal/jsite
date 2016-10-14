class JobsController < ApplicationController
  # note: Job class is not ActiveRecord based
  # do not use as such

  # ToDo: could add before_filter to grab current query and location info
  # to @query and @location for use in queries and display
  # ToDo: Add before_filter for @current_user retrieval

  # show all jobs
  def index
    @jobs = Job.all
    # could store event that all these were "seen"
    case params['ui']
    when "default"
      render :template => 'jobs/index', :layout => "application"
    when "alt"
      render :template => 'jobs/index', :layout => "application2"
    when nil
      render :template => 'jobs/index', :layout => "application"
    end
      
  end

  # show one job
  def show
    @current_user = nil
    time_stamp = Time.now
    @job = Job.find(params[:id])
    # record that job has been visited
    Event.new(@job, time_stamp, @current_user, "click").save
    # ToDo: could do separate layout for popup so that things layout better
    # render :template => 'jobs/show', :layout => 'popup'
  end

end
