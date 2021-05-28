class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
    # respond_to do |format|
    #   format.js
    # end
  end

  def show
    @rooms = Room.all
    render 'index'
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create_room
    @room = Room.new(name: params[:room_name])

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: "Room was successfully created." }
        format.json { render :index, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

 

  private
    def set_room
      @room = Room.find(params[:id])
    end
end
