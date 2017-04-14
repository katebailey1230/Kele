require "httparty"
require "json"

class Kele
  include HTTParty

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
end