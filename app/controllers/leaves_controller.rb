# frozen_string_literal: true

class LeavesController < ApplicationController
  before_action :set_leafe, only: [:show, :edit, :update, :destroy]

  # GET /leaves
  # GET /leaves.json
  def index
    @leaves = Leave.all
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
  end

  # GET /leaves/new
  def new
    @leafe = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end

  # POST /leaves
  # POST /leaves.json
  def create
    @leafe = Leave.new(leafe_params)

    respond_to do |format|
      if @leafe.save
        format.html { redirect_to @leafe, notice: "Leave was successfully created." }
        format.json { render :show, status: :created, location: @leafe }
      else
        format.html { render "new" }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update
    respond_to do |format|
      if @leafe.update(leafe_params)
        format.html { redirect_to @leafe, notice: "Leave was successfully updated." }
        format.json { render :show, status: :ok, location: @leafe }
      else
        format.html { render "edit" }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leafe.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: "Leave was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leafe
      @leafe = Leave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leafe_params
      params.fetch(:leafe, {})
    end
end
