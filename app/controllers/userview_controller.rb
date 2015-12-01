class UserviewController < ApplicationController
  def homepage
    @tweets = Tweet.all
    @response = Response.all
    @users = User.all


  end
end
