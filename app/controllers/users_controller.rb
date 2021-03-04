class UsersController < ApplicationController
    def welcome 
        flash.notice = "Aisle Inventory - 2021  ©"
   end 

   def new 
       @user = User.new
   end

   def create 
    session = @session
       @user = User.new(user_params)
       if @user.save
        UserMailer.registration_confirmation(@user).deliver!
        @session[:user_id] = @user.employeeInit
           redirect_to root_path, notice: "Welcome"
       else
           render :new, notice: "Access Denied"
       end
   end 

   private 

   def user_params 
       params.require(:user).permit(:password, password_confirmation, :store_id, :notes, :employeeInit, :password_digest, :telephone, :uid, :uname, :uemail)
   end     

   def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            redirect_to 'sign_in_path'
            flash[:notice] = "Welcome to the Aisle Inventory!"

        else
            flash[:error] = "Sorry. User does not exist"
            redirect_to root_url
        end
    end
end
