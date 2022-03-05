class CoursesController < ApplicationController

	def new
	    @course = current_user.courses.build
	end

  	def create
  		
	    @course = current_user.courses.build(course_params)

	    if @course.save
	    	flash[:notice] = "course has saved"
	    	redirect_to @course
	    else
	    	 flash[:error] = "course has not saved"
	    	render :new, status: :unprocessable_entity
	    end
 	end

	def show
	  @course = Course.find(params[:id])
	end

	def index
	  @courses = Course.all
	end

	def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "course has updated"
      redirect_to @course 
    else
      flash[:error] = "try again to update"
      render edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "course has destroyed"
    redirect_to root_path, status: :see_other
  end

	def search
		@query = params[:query]
	    @courses = Course.where("courses.name like ?", ["%#{@query}%"])
	    render :index
	end

	private
	def course_params
	  params.require(:course).permit(:name, :discription, :image, :user_id)
	end
end
