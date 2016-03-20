require "rubygems"
require "mixpanel_client"
require "google/api_client"
require "google_drive"
require "pry"
require "./client"
require './specs'
require './spreadsheet'


sign_up = Specs.new(@client, 'SignUp', 'authenticationMethod', "facebook", 'unique', 1)
sign_up.insert
sign_in = Specs.new(@client, 'SignIn', "$browser", "Chrome", 'unique', 2)
sign_in.insert
pr = Specs.new(@client, 'VoteMade', '$city', 'Paris', 'unique', 3)
pr.insert

