class UsersController < ApplicationController
  
  before_action :only_council, except: [:show]

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
    
    if params[:term1]
      @professionals = User.where('lower(names) LIKE lower(?)', "%#{params[:term1]}%")
      flash[:notice] = "No result found for professionals #{params[:term1]}" if @professionals.nil? || @professionals.blank?
    else
      @professionals = User.where(user_role: 'professional')
    end
  end
  
  def index
  
    @professionals = User.all
    User.where('names LIKE ? or last_name LIKE ?', "%#{params[:search]}%","%#{params[:search]}%")
end

def search
  @professionals = professional.search(params[:search])
  @user = User.all
end

  def instructor
    if params[:term1]
      @instructors = User.where('lower(names) LIKE lower(?)', "%#{params[:term1]}%")
      flash[:notice] = "No result found for this instructors #{params[:term1]}" if @instructors.nil? || @instructors.blank? 
    else
      @instructors = User.where(user_role: 'instructor')
    end
    
  end
  def quiz

  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save

        # Tell the UserMailer to send a welcome email after save
        #UserMailer.with(user: @user).welcome_email.deliver_later
        #UserNotifierMailer.with(user: @user).email.deliver_now!
        UserNotifierMailer.send_signup_email(@user).deliver

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def sign_up_params
    params.require(:user).permit(:names, :email, :phone, :gender, :province, :district, :password, :password_confirmation, :user_role, :reguratory_body, :apload_diploma, :apload_cv, :working_place, :last_name, :search)
  end

  def account_update_params
    params.require(:user).permit(:names, :email, :phone, :gender, :province, :district, :password, :password_confirmation, :user_role, :reguratory_body, :apload_diploma, :apload_cv, :working_place, :last_name, :search)
  end
end