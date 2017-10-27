class WishesController < ApplicationController
  def index
  end

  def new
  end

  def create
    wish = Wish.new
    if session[:item_id]
      wish.wished_for = Item.find(session[:item_id])
      session.delete(:item_id)
      wish.wisher = current_user
      wish.save
    else 
      wish.wished_for = Item.find(params[:item_id])
      wish.wisher = current_user
      wish.save
    end
    return redirect_to items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
    wishes = Wish.all.where(wisher: current_user)
    wish = wishes.all.where(wished_for: params[:id])[0]
    wish.delete
    return redirect_to items_path
  end
end
