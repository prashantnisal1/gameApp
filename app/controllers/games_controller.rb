class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def play
    @user = User.find(session[:user_id])
    @game = Game.find( session[:game_id]) 
  end
  
  def welcome
  end

  def setup
    @user = User.find_or_create_by(name: 'player')
    @dealer = User.find_or_create_by(name: 'dealer')
    @game = Game.create
    @game.users << @user
    session[:user_id] = @user.id
    session[:dealer_id] = @dealer.id
    session[:game_id] = @game.id
    redirect_to :action => "play"
  end

  def hit
    @user = User.find(session[:user_id])
    @game = Game.find( session[:game_id])

    @user.hit_me(@game)

    redirect_to :action => "play"
  end

  def stand
    @user = User.find(session[:user_id])
    @game = Game.find( session[:game_id])

    dealer = @game.dealer
    if dealer.dealer_strategy(@game) then
      dealer.hit_me(@game)
    else
      if dealer.hand(@game).value >  @user.hand(@game).value
        dealer.hit_me(@game)
      else
        @user.hit_me(@game)
      end
    end
    redirect_to :action => "play"
  end

  # def new
  #   @game = Game.new
  # end
end
