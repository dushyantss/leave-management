# frozen_string_literal: true

class OptionalHolidaysController < ApplicationController
  before_action :set_optional_holiday, only: [:show, :edit, :update, :destroy]

  # GET /optional_holidays
  # GET /optional_holidays.json
  def index
    @optional_holidays = OptionalHoliday.all
  end

  # GET /optional_holidays/1
  # GET /optional_holidays/1.json
  def show
  end

  # GET /optional_holidays/new
  def new
    @optional_holiday = OptionalHoliday.new
  end

  # GET /optional_holidays/1/edit
  def edit
  end

  # POST /optional_holidays
  # POST /optional_holidays.json
  def create
    @optional_holiday = OptionalHoliday.new(optional_holiday_params)

    respond_to do |format|
      if @optional_holiday.save
        format.html { redirect_to @optional_holiday, notice: "Optional holiday was successfully created." }
        format.json { render :show, status: :created, location: @optional_holiday }
      else
        format.html { render "new" }
        format.json { render json: @optional_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /optional_holidays/1
  # PATCH/PUT /optional_holidays/1.json
  def update
    respond_to do |format|
      if @optional_holiday.update(optional_holiday_params)
        format.html { redirect_to @optional_holiday, notice: "Optional holiday was successfully updated." }
        format.json { render :show, status: :ok, location: @optional_holiday }
      else
        format.html { render "edit" }
        format.json { render json: @optional_holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /optional_holidays/1
  # DELETE /optional_holidays/1.json
  def destroy
    @optional_holiday.destroy
    respond_to do |format|
      format.html { redirect_to optional_holidays_url, notice: "Optional holiday was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_optional_holiday
      @optional_holiday = OptionalHoliday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def optional_holiday_params
      params.require(:optional_holiday).permit(:title, :description, :date, :lock_version)
    end
end
