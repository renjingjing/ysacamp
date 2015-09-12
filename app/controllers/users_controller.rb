class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update]
def new
@user = User.new
end

def index
@users =User.all
 # User.where('admin != ?','true')
# puts @users
# print ">>>>>>>>>>>>>>>>>>>>>>>>>>>>"
if params[:search]
    @users = User.search(params[:search]).order("#{params[:order]}")
    # .page(params[:page])
    # .per(PER_PAGE)
  else
    @users = User.order("#{params[:order]}")
    # .page(params[:page])
    # .per(PER_PAGE)
  end
end

def show
  @user = User.find params[:id]
end

def edit
    @user=User.find params[:id]
end

def create
  @user = User.new user_params
  if @user.save
    redirect_to root_path
  else
    flash[:alert] = "See errors below"
    render :new
  end
end


def update
  if can? :admin, current_user
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to users_path, notice: "Profile updated"
    else
      flash[:alert] = "See errors below"
      render users_path
    end
  else
     @user = current_user
     if @user.authenticate(params[:user][:current_password])
       if @user.update user_params
         redirect_to edit_users_path, notice: "Profile updated"
       else
         flash[:alert] = "See errors below"
         render :edit
       end
     else
       flash[:alert] = "Wrong password"
       render :edit
     end
  end
 end

 def destroy
     @user = User.find params[:id]
     if current_user.admin?
      @user.destroy
      redirect_to @user, notice: 'user removed'
     else
       redirect_to root_path, alert: 'Access denied'
     end
 end

private

def user_params
  params.require(:user).permit(:first_name, :last_name,:parent_name, :email1,:email2,
                                :password, :password_confirmation,:address,
                                :gender,:school,:grade,:age,:cell_phone,:registration_time,:note)
end
end
