class SupervisionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find(params[:id])
    user.level = "lead"
    user.save

    dept = Dept.find(user.dept)
    drs = dept.users.where.not(id: user.id)

    drs.each do |dr|
      sup = Supervision.new
      sup.lead = user
      sup.dr = dr
      sup.save
    end
    return redirect_to :back
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
    user = User.find(params[:id])
    user.level = "reg"
    user.save

    user.drs.each do |dr|
      sups = Supervision.where(lead: user)
      sup = sups.where(dr: dr)[0]
      sup.delete
    end  
    return redirect_to :back
  end
end
