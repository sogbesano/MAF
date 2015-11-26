class UsersController < ApplicationController
  before_action :set_current_page, except: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  #GET /users
  #GET /users.json
  def index
      @users = User.paginate(page: params[:page],
			     per_page: params[:per_page]).order('surname, firstname')
  end

  #GET /users/1
  #GET /users/1.json
  def show
  end

  #GET /users/new
  def new
    @user = User.new
  end

  #GET /users/1/edit
  def edit
  end

  #POST /users
  #POSER /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
    if @user.save#attemps to save user
        format.html { redirect_to(user_url(@user, page: @current_page),
                                  notice: 'Account was successfully created.') }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

   # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:firstname, :surname, :email, :email_confirmation, :password, :password_confirmation, :address)
  end

    private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end


  def set_current_page
    @current_page = params[:page] || 1
  end
  
  def show_record_not_found(exception)
    respond_to do |format|
      format.html {
        redirect_to(users_url(page: @current_page),
                    notice: 'Account no longer exists.')
      }
      format.json {
        render json: '{Account no longer exists.}',
               status: :unprocessable_entity
      }
    end
  end


end
