class UsersController < ApplicationController
  def show
    prototype = Prototype.find(params[:id])
    @user = prototype.user
  end

end
