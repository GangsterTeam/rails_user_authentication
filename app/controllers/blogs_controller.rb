class BlogsController < ApplicationController
  # before any blog action happens, it will authenticate the user
  before_action :authenticate_user!
  def index
    @user = current_user.email
  end
  #Other Restful methods show, new, edit, create, update, destroy
end
