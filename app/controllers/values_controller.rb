class ValuesController < ApplicationController
  before_action :find_value, only: %i[ show edit update destroy ]

  # GET /values or /values.json
  def index
    @values = Value.all
  end

  # GET /values/1 or /values/1.json
  def show
  end

  # GET /values/new
  def new
    @value = Value.new
  end

  # GET /values/1/edit
  def edit
  end

  # POST /values or /values.json
  def create
    @value = Value.new(value_params)
    @value.image_id = @image.id
    @value.user_id = @current_user.id
    if @value.save
      redirect_to image_path(@image)
    else
      render 'new'
    end

    respond_to do |format|
      if @value.save
        format.html { redirect_to value_url(@value), notice: "Value was successfully created." }
        format.json { render :show, status: :created, location: @value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values/1 or /values/1.json
  def update
    respond_to do |format|
      if @value.update(value_params)
        format.html { redirect_to value_url(@value), notice: "Value was successfully updated." }
        format.json { render :show, status: :ok, location: @value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1 or /values/1.json
  def destroy
    @value.destroy

    respond_to do |format|
      format.html { redirect_to values_url, notice: "Value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_value
      @value = Value.find(params[:image_id])
    end

    # Only allow a list of trusted parameters through.
    def value_params
      params.require(:value).permit(:user_id, :image_id, :value)
    end
end
