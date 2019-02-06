***Please note that this was created using Ruby on Rails v. 4.2.5 using Ruby v. <3.0.

# Kele

A Ruby Gem API client:

This was completed as a project for Bloc, as the purpose of the Kele API Client was to access the student endpoints of Bloc's API. 

# Initialization

With the skeleton of Kele created, add an initialize method that creates a new Kele client authorized with a username and password. The client can be used as follows:

  1. Bloc's base API 
  2. The user's authentication token, which can be retrieved from the sessions endpoint.
  
To retrieve the authentication token include HTTParty in Kele, use  self.class.post, and pass in the sessions URL along with username and password. See the HTTParty repository for examples.




