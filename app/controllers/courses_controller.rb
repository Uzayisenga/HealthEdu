class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :can_create_course, only: [:new, :create]

  # before_action :only_admin, only: [:edit, :new]

  # before_action :only_admin, only: [:edit, :new]


  # GET /courses
  # GET /courses.json
  def index
      @currentUser = current_user.id
      @courses = current_user.courses.all.order('created_at DESC').page (params[:page])
  end

  def all_course
    #@courses = Course.all
    if (params.has_key?(:course_for))
      @courses = Course.where(course_for: params[:course_for]).order("created_at desc")
    else
      @q = Course.ransack(params[:q])
      @courses = @q.result(distinct: true)
    end
    @profiles =Profile.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
   @courses = Course.paginate(:page => params[:page], :per_page=>5)
   @favorite = current_user.favorites.find_by(course_id: @course.id)

  end

  # GET /courses/new
  def new
    @course = current_user.courses.build
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_user.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def course_params
    params.require(:course).permit(:image, :image_cache)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:image, :title, :credit_number, :content, :content_attract, :course_price, :quiz_link, :video, :attemption, :user_id, :course_for)
    end

    def only_admin
      unless current_user.user_role == 'instructor'
         redirect_to courses_url, notice: 'you are not allowed to access this page.'
      end
    end

    def only_admin
      unless current_user.user_role == 'instructor'
         redirect_to courses_url, notice: 'you are not allowed to access this page.'
      end
    end
    def uploadFile
      course = Course.save(params[:upload])
      render :text => "File has been uploaded successfully"
  end

  def check_payment
    unless current_user && @course.status == "paid"
    end
  end

  def can_create_course
    unless current_user && current_user.user_role == "admin" || current_user && current_user.user_role == "instructor"
      redirect_to courses_url, notice: "you are not allowed to upload a course"
    end
  end
end
