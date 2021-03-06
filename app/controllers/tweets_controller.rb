class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @response_this = []

    @responses = Response.all

    @responses.each do |response|
      if response.tweet == nil

      else
        if response.tweet.id == @tweet.id
          @response_this.push(response)
        end
      end

    end

  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet_id = @tweet.id
    @responses = Response.all
    @responses.each do |r|
      if r.tweet_id == @tweet_id
        r.destroy
      end
    end
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tweet_params
    params.require(:tweet).permit(:message, :user_id, :photo, :title)
  end
end
