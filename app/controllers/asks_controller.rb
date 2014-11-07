class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: :show

  # GET /asks
  # GET /asks.json
  def index
    @asks = policy_scope(Ask).page(params[:page])
  end

  # GET /asks/1
  # GET /asks/1.json
  def show
    @ask = Ask.includes(comments: [:user]).order("created_at").find(params[:id])
    @comments = @ask.comments.page(params[:page])
  end

  # GET /asks/new
  def new
    @user = current_user
    @ask = Ask.new
    authorize @ask
  end

  # GET /asks/1/edit
  def edit
  end

  # POST /asks
  # POST /asks.json
  def create
    @ask = current_user.asks.new(ask_params)
    authorize @ask

    respond_to do |format|
      if @ask.save
        format.html { redirect_to @ask, notice: 'Ask was successfully created.' }
        format.json { render :show, status: :created, location: @ask }
      else
        format.html { render :new }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asks/1
  # PATCH/PUT /asks/1.json
  def update
    respond_to do |format|
      if @ask.update(ask_params)
        format.html { redirect_to @ask, notice: 'Ask was successfully updated.' }
        format.json { render :show, status: :ok, location: @ask }
      else
        format.html { render :edit }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asks/1
  # DELETE /asks/1.json
  def destroy
    @ask.destroy
    respond_to do |format|
      format.html { redirect_to asks_url, notice: 'Ask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ask
      @ask = Ask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ask_params
      params.require(:ask).permit(:title, :body)
    end
end
