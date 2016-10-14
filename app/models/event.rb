require 'httparty'
require 'json'

# ToDo: should this derive from an Active* helper?
class Event

  # simple, store who, when and which job
  attr_accessor :time_stamp, :user_id, :job_id, :type 


  # job - a json job
  # user - a rails user
  # timestamp - a Time object with time this click occurred
  # type - seen, clicked, saved, etc
  def initialize(job, time_stamp, user=nil, type=nil)
    self.job_id = job['id']
    self.time_stamp = time_stamp
    self.user_id = user.nil? ? nil : user.id
    self.type = type.nil? ? nil : type
  end
  
  def save
    # 
    result = HTTParty.post("http://localhost:3000/events", 
                      :body => {:job_id => self.job_id,
                                 :user_id => self.user_id,
                                 :time_stamp => self.time_stamp.to_i, 
                                 :type => self.type}.to_json,
                      :headers => { 'Content-Type' => 'application/json' } )
    # check result for success?
  end

  # not building a viewer so 
  # def self.all or .find not needed

end
