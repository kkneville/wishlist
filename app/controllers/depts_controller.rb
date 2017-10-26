class DeptsController < ApplicationController
  def index
  end

  def new
  end

  def create
    dept = Dept.new
    dept.name = params[:newdept]
    dept.save
    return redirect_to :back
  end

  def show
  end

  def edit
  end

  def update
    params[:emp].each do |id|
      id.to_i
      user = User.find(id)
      user.dept = Dept.find(params[:dept])
      user.save
    end  
    return redirect_to :back  
  end

  def reassign
    user = User.find(params[:id])
    user.dept = nil
    user.save
    return redirect_to :back
  end

  def delete
    dept = Dept.find(params[:id])
    dept.users.each do |user|
      user.dept = nil
      user.save
    end  
    dept.delete
    return redirect_to :back
  end
end
