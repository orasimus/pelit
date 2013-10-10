class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:controller => "main", :action => "index")
      else
        flash.now[:notice] = "You are invalid."
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(:controller => "main", :action => "index")
  end
end
