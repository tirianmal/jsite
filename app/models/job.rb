require 'httparty'
require 'json'

# ToDo: should this derive from an Active* helper?
class Job

  # not using yet, no posts in demo
  attr_accessor :id, :posted, :company, :poster, :city, :state, :title, :body, :keywords

  # not using yet
  def initialize(json_job)
    self.id       = json_job['id']
    self.posted   = json_job['posted']
    self.company  = json_job['company']
    self.poster   = "localhost:3000" 
    self.city     = json_job['city']
    self.state    = json_job['state']
    self.title    = json_job['title']
    self.body     = json_job['body']
    self.keywords = json_job['keywords']
  end
  
  # for index, go to jobs "API" and grab records
  def self.all
    response = HTTParty.get("http://localhost:3000/jobs")
    jobs = JSON.parse(response.body)
    # sort them descending by date posted
    jobs = jobs.sort_by {|job| -job['posted']}
  end

  def self.find(id)
    # we -might- get more than one, but really shouldn't given this interface
    job = self.all.select {|job| job['id'] == id.to_i}.first
    # could replace with Job.new(job) ... leave for now
  end

end
