class ItemsController < ApplicationController
  def index
    @user = current_user
    @wishes = @user.wished_fors.all
    @other = Item.where.not(id: @wishes)
    q1 = current_user.friends
    q2 = current_user.users
    @friends = q1 + q2
    @people = User.where.not(id: @friends)
  end

  def new
  end

  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        session[:item_id] = @item.id
        return redirect_to add_wish_path
      end
      flash[:errors] = @item.errors.full_messages
      return redirect_to :back
  end

  def show
    @item = Item.find(params[:id])
    @users = User.where(id: @item.wishers) 

  end

  def edit
  end

  def update
  end

  def delete
  end

  private
    def item_params
      params.require(:item).permit(:name, :price).merge(user: current_user)
    end 

end
