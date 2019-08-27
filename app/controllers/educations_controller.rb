class EducationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  

  # GET /educations
  # GET /educations.json
  def index
    @educations = current_user.educations
    @arrEducations = @educations.to_a
  end
  def index1
    @educations = Education.all
    @arrEducations = @educations.to_a
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  def new_post
    @post = Post.new
    @education = Education.find(params[:id])
    @posts = @education.posts.order("created_at DESC")
    @education_id = Education.find(params[:id]).id
  end

  def new_post1
    current_education = Education.find(params[:id])
    @post = current_education.posts.build(params.require(:post).permit(:content, :id, images:[]))
    
    if @post.save
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    else
      flash[:alert] = "Something went wrong..."
      render :new_post
    end
  end
  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  def edit_post
    @post = Post.find_by(id: params[:id])
    @education_id = @post.education.id
  end

  def post_destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/educations/#{@post.education.id}/new_post", notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def update_post
    @post = Post.find_by(id: params[:id])
    respond_to do |format|
      if @post.update(params.require(:post).permit(:content, :id, images:[]))
        format.html { redirect_to "/educations/#{@post.education.id}/new_post", notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post}
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = current_user.educations.build(education_params)
    respond_to do |format|
      if @education.save
        @education.reindex
        # byebug
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @education }
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:name, :number, :email, :about, :accepted_documents, :services, :status, :latitude, :longitude, :address, :link, images:[])
    end
end
