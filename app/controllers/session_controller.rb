class SessionController < ApplicationController
  def login
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      unless teacher
        flash.now[:notice] = "Invalid username"
      end
      if teacher && teacher.authenticate(params[:password_digest])
        session[:user_id] = teacher.id
        redirect_to parents_path, notice: "Log in successful."
      else
        flash.now[:notice] = "Invalid password"
      end
    end
    @teachers = Teacher.all
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Log out successful."
  end
end
