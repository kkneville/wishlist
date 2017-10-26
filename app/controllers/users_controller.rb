class UsersController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def new
    if current_user
      return redirect_to items_path
    end  
    @countries = ["US", "TX", "UK", "CH", "CAN", "DE", "FR", "DM", "SW", "IT", "KE", "SA"]
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id]= user.id
      return redirect_to items_path
    end
    flash[:errors] = user.errors.full_messages    
    return redirect_to :back
  end

  def show
    @user = User.find(params[:user_id])
    @items = @user.wished_fors.all
    return render "/users/show.html.erb"
  end 

  def edit
    @countries = ["US", "TX", "UK", "CH", "CAN", "DE", "FR", "DM", "SW", "IT", "KE", "SA"]
  end

  def update
    user = update_user(user_params)
    if user.valid?
      user.save
    end  
    return redirect_to items_path
  end

  def delete
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :location, :country, :password, :password_confirmation)
    end 

    def update_user(params)
    user = User.find(current_user.id)
    user.firstname = params[:firstname]
    user.lastname = params[:lastname]
    user.email = params[:email]
    user.dob = params[:dob]
    user.country = params[:country]
    user.save
    return user
    end 

end
