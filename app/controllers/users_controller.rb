class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :summary]
  before_action :set_user, only: [:summary]

  def index
    @users = User.all
  end

  def summary
    @questions = @user.questions
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
