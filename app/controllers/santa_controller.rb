class SantaController < ApplicationController
  def index
    if not current_user.level == "admin"
      return redirect_to index_path 
    end  
    @users = User.all.where.not(id: current_user.id)
  end

  def new
  end

  def create

    users = []
    a = User.all.where(level: "reg")
    a.each do |user|
      user.push(user)
    end

    santas1 = []
    while users.length > 0 do
        santas1.push(users.slice!(users[rand(0...users.length)]))
    end

    i = 0
    while i < santas1.length-1 do
      s = Santum.new
      s.gifter = User.find(santas1[i].id)
      s.giftee = User.find(santas1[i+1].id)
      s.save
      i += 2
    end
    s = Santum.new
    s.gifter = User.find(santas1[santas1.length].id)
    s.giftee = User.find(santas1[0])

    users = [] 
    a = User.all.where(level: "lead")
    a.each do |user|
      users.push(user)
    end

    santas2 = []
    while users.length > 0 do
        santas2.push(users.slice!(users[rand(0...users.length)]))
    end

    i = 0
    while i < santas2.length-1 do
      s = Santum.new
      s.gifter = User.find(santas2[i].id)
      s.giftee = User.find(santas2[i+1].id)
      s.save
      i += 2
    end
    s = Santum.new
    s.gifter = User.find(santas2[santas2.length].id)
    s.giftee = User.find(santas2[0])

    return redirect_to back:
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
