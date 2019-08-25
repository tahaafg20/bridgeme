class NgosController < ApplicationController
  before_action :set_ngo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /ngos
  # GET /ngos.json
  def index
    @ngos = Ngo.all
    @arrNgos = @ngos.to_a
  end

  def index1
    @ngos = Ngo.all
    @arrNgos = @ngos.to_a
  end

  # GET /ngos/1
  # GET /ngos/1.json
  def show
  end

  def new_post
    @post = Post.new
    @ngo = Ngo.find(params[:id])
    @ngo_id = Ngo.find(params[:id]).id
  end

  def new_post1
    current_ngo = Ngo.find(params[:id])
    @post = current_ngo.posts.build(params.require(:post).permit(:content, :id))
    
    if @post.save
      redirect_to @post, notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new_post
    end
  end
  # GET /ngos/new
  def new
    @ngo = Ngo.new
  end

  # GET /ngos/1/edit
  def edit
  end

  # POST /ngos
  # POST /ngos.json
  def create
    @ngo = current_user.ngos.build(ngo_params)
    respond_to do |format|
      if @ngo.save
        @ngo.reindex
        format.html { redirect_to @ngo, notice: 'Ngo was successfully created.' }
        format.json { render :show, status: :created, location: @ngo }
      else
        format.html { render :new }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ngos/1
  # PATCH/PUT /ngos/1.json
  def update
    respond_to do |format|
      if @ngo.update(ngo_params)
        format.html { redirect_to @ngo, notice: 'Ngo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ngo }
      else
        format.html { render :edit }
        format.json { render json: @ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ngos/1
  # DELETE /ngos/1.json
  def destroy
    @ngo.destroy
    respond_to do |format|
      format.html { redirect_to ngos_url, notice: 'Ngo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ngo
      @ngo = Ngo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ngo_params
      params.require(:ngo).permit(:name, :address, :number, :longitude, :latitude, :email, :services, :about, :status, :link, :accepted_documents)
    end
end
