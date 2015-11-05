class ClasstimetablesController < ApplicationController
  before_action :set_classtimetable, only: [:show, :edit, :update, :destroy]

  # GET /classtimetables
  # GET /classtimetables.json
  def index
    @classtimetables = Classtimetable.all
  end

  # GET /classtimetables/1
  # GET /classtimetables/1.json
  def show
  end

  # GET /classtimetables/new
  def new
    @classtimetable = Classtimetable.new
  end

  # GET /classtimetables/1/edit
  def edit
  end

  # POST /classtimetables
  # POST /classtimetables.json
  def create
    @classtimetable = Classtimetable.new(classtimetable_params)
    respond_to do |format|
      if @classtimetable.save
        format.html { redirect_to @classtimetable, notice: 'Classtimetable was successfully created.' }
        format.json { render :show, status: :created, location: @classtimetable }
      else
        format.html { render :new }
        format.json { render json: @classtimetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classtimetables/1
  # PATCH/PUT /classtimetables/1.json
  def update
    respond_to do |format|
      if @classtimetable.update(classtimetable_params)
        format.html { redirect_to @classtimetable, notice: 'Classtimetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @classtimetable }
      else
        format.html { render :edit }
        format.json { render json: @classtimetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classtimetables/1
  # DELETE /classtimetables/1.json
  def destroy
    @classtimetable.destroy
    respond_to do |format|
      format.html { redirect_to classtimetables_url, notice: 'Classtimetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classtimetable
      @classtimetable = Classtimetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classtimetable_params
      params.require(:classtimetable).permit(:start_time,
                                      :start_day,
                                      :unit_class_times,
                                      :minutes_per_class).tap do |whitelisted|
                                      whitelisted[:weekdays] = params[:classtimetable][:weekdays].reject!{|a| a==""}
                                      # this reject trime the "" items from weekdays array
    end
    end
end
