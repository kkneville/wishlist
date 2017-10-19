class ItemsController < ApplicationController
  def index
    @user = current_user
    @wishes = @user.wished_fors.all
    @other = Item.where.not(id: @wishes)
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
