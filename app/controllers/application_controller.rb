class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def create_user
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
      if @user.save
        session[:user_id] = @user.id
        redirect "/restaurants"
      else
        status 422
        @errors = @user.errors.full_messages
        erb :'users/new'
      end
  end
  helper_method :create_user

  def login
    user = User.authenticate(params[:user][:email], params[:user][:password_digest])
      if user
        session[:user_id] = user.id
        redirect '/restaurants'
     else
       status 422
        @errors = ["Login Attempt Failed."]
        redirect_to '/sessions/new'
      end
  end
  helper_method :login

  def logged_in?
    !!@current_user
  end
  helper_method :logged_in?

  def find_user
    if session[:user_id]
      @user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :find_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def create_restaurant
    # find_user
    @restaurant = Restaurant.new(name: params[:name], cuisine: params[:cuisine], address: params[:address],
    city: params[:city], state: params[:state], zip: params[:zip], user_id: 1)
      if @restaurant.save
        # redirect_to '/restaurants'
        render plain: "Restaurant saved", status: 200
      else
        render plain: "Something went wrong", status: 422
      end
  end
  helper_method :create_restaurant

  def update_restaurant
    find_user
    @restaurant = Restaurant.find_by(id: params[:id])
     if @restaurant.user_id = @user.id
        @restaurant.update(params[:restaurant])
    end
      if @restaurant.save
        redirect_to "/restaurants/#{@restaurant.id}"
      else
        status 422
        @errors = @restaurant.errors.full_messages
        erb :'restaurants/edit'
      end
  end
  helper_method :update_restaurant

  def create_review
  find_user
  @restaurant = Restaurant.find_by(id: params[:id])
  @review = Review.new(numerical_review: params[:review][:numerical_review], content: params[:review][:content],
  restaurant_id: params[:review][:restaurant_id], user_id: @user.id)
    if @review.save
      erb :'restaurants/show'
    else
      status 422
      @errors = @review.errors.full_messages
      erb :'restaurants/show'
    end
  end
  helper_method :create_review

end
