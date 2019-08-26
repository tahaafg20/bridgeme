class CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  # GET /communities
  # GET /communities.json
  def index
    @communities = current_user.communities
    @arrCommunities = @communities.to_a
  end
  def index1
    @communities = Community.all
    @arrCommunities = @communities.to_a
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
  end

  def new_post
    @post = Post.new
    @community = Community.find(params[:id])
    @posts = @community.posts.order("created_at DESC")
    @community_id = Community.find(params[:id]).id
  end

  def new_post1
    current_community = Community.find(params[:id])
    @post = current_community.posts.build(params.require(:post).permit(:content, :id, images:[]))
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    else
      flash[:alert] = "Something went wrong..."
      render :new_post
    end
  end

  def edit_post
    @post = Post.find_by(id: params[:id])
    @community_id = @post.community.id
  end

  def post_destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/communities/#{@post.community.id}/new_post", notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def update_post
    @post = Post.find_by(id: params[:id])
    respond_to do |format|
      if @post.update(params.require(:post).permit(:content, :id, images:[]))
        format.html { redirect_to "/communities/#{@post.community.id}/new_post", notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post}
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = current_user.communities.build(community_params)
    respond_to do |format|
      if @community.save
        @community.reindex
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:name, :email, :link, :number, :country, :services, :about, :status, :link, :address, :longitude, :latitude, :authenticity_token, :id, images:[])
    end
end
