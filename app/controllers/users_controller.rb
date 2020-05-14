class UsersController < ApplicationController
  before_action :only_council, except: [:show]
  def search
    q = params[:q]
    @users    = User.search(names_cont: q).result
    @courses = Course.search(title_cont: q).result
    #@users    = User.search(name_cont: q).result
  end
  def index

    if params[:id]
      @users = User.where(" names Like ?", "%#{params[:id]}%")
    else
      @users = User.all
    end

    @q = User.ransack(params[:q])
    @users = @q.result.includes(:user).page(params[:page])

  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = UserPdf.new(@user)
        send_data pdf.render, filename: "user_#{@user.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def only_council
    if current_user.user_role != 'council'
      redirect_to courses_url, notice: 'go to courses'
    end
  end
  def professional
    @professionals = User.where(user_role: 'professional')
  end

  def instructor
    @instructors = User.where(user_role: 'instructor')
  end

  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save

        # Tell the UserMailer to send a welcome email after save
        #UserMailer.with(user: @user).welcome_email.deliver_later
        #UserNotifierMailer.send_signup_email(@user).deliver
        UserMailer.signup_confirmation(@user).deliver_now!
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
