class HealthsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /healths
  # GET /healths.json
  def index
    @healths = Health.all
    @arrHealths = @healths.to_a
  end

  def index1
    @healths = Health.all
    @arrHealths = @healths.to_a
  end

  def new_post
    @post = Post.new
    @health = Health.find(params[:id])
    @posts = @health.posts.order("created_at DESC")
    @health_id = Health.find(params[:id]).id
  end

  def new_post1
    current_health = Health.find(params[:id])
    @post = current_health.posts.build(params.require(:post).permit(:content, :id))
    
    if @post.save
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    else
      flash[:alert] = "Something went wrong..."
      render :new_post
    end
  end
  # GET /healths/1
  # GET /healths/1.json
  def show
  end

  # GET /healths/new
  def new
    @health = Health.new
  end

  # GET /healths/1/edit
  def edit
  end

  # POST /healths
  # POST /healths.json
  def create
    @health = current_user.healths.build(health_params)
    respond_to do |format|
      byebug
      if @health.save
        format.html { redirect_to @health, notice: 'Health was successfully created.' }
        format.json { render :show, status: :created, location: @health }
      else
        format.html { render :new }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healths/1
  # PATCH/PUT /healths/1.json
  def update
    respond_to do |format|
      if @health.update(health_params)
        format.html { redirect_to @health, notice: 'Health was successfully updated.' }
        format.json { render :show, status: :ok, location: @health }
      else
        format.html { render :edit }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_post
    @post = Post.find_by(id: params[:id])
    @health_id = @post.health.id
  end

  def post_destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/healths/#{@post.health.id}/new_post", notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def update_post
    @post = Post.find_by(id: params[:id])
    respond_to do |format|
      if @post.update(params.require(:post).permit(:content, :id))
        format.html { redirect_to "/healths/#{@post.health.id}/new_post", notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post}
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /healths/1
  # DELETE /healths/1.json
  def destroy
    @health.destroy
    respond_to do |format|
      format.html { redirect_to healths_url, notice: 'Health was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health
      @health = Health.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_params
      params.require(:health).permit(:name, :number, :link, :email, :services, :about, :address, :latitude, :longitude, :accepted_documents, :status)
    end
end
