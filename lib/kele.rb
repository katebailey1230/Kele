require 'httparty'
require 'json'
require './lib/roadmap.rb'
require './lib/messages.rb'

class Kele
  include HTTParty
  include Roadmap
  include Messages

  def initialize(email, password)
    
    @api_url = 'https://www.bloc.io/api/v1/sessions'
    receive = self.class.post(@api_url, body: {  'email': email, 'password': password })

    raise ArgumentError, "Email or password is invalid, please try again" unless receive.code == 200
    @auth_token = receive["auth_token"]
  end
 
  def get_me
    response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end 
 
  def get_mentor_availability(mentor_id)
    response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })

    @get_mentor_availability = JSON.parse(response.body, symbolize_names: true)
  end
 
end