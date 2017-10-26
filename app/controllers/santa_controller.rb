class SantaController < ApplicationController
  def index
    if not current_user.level == "admin"
      return redirect_to index_path 
    end  
    @reg = User.where(level: "reg")
    @sup = User.where(level: "lead")
    @santas = Santum.all
  end

  def new
  end

  def create

    users = []
    a = User.where(level: "reg")
    a.each do |user|
      users.push(user.id)
    end

    users.shuffle!

    i = 0
    while i < users.length-1 do
      s = Santum.new
      s.gifter = User.find(users[i])
      s.giftee = User.find(users[i+1])
      s.save
      i += 1
    end
    s = Santum.new
    s.gifter = User.find(users[users.length-1])
    s.giftee = User.find(users[0])
    s.save


    users = []
    a = User.where(level: "lead")
    a.each do |user|
      users.push(user.id)
    end

    users.shuffle!

    i = 0
    while i < users.length-1 do
      s = Santum.new
      s.gifter = User.find(users[i])
      s.giftee = User.find(users[i+1])
      s.save
      i += 1
    end
    s = Santum.new
    s.gifter = User.find(users[users.length-1])
    s.giftee = User.find(users[0])
    s.save

    return redirect_to :back
  end

  def show
    @giftee = current_user.giftees.first
  end

  def edit
  end

  def update
  end

  def delete
    santas = Santum.all
    santas.each do |santa|
      santa.delete
    end
    return redirect_to :back
  end
end
