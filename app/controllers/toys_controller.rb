class ToysController < ApplicationController
  before_action :find_toy, only: [:show, :edit, :update, :destroy]
  
  def index
      @toy = current_user.toy
  end

  def home
      @toy = Toy.all
  end

  def show
      #find_toy
  end

  def new
      @toy = Toy.new
  end

  def edit
      #find_toy
  end

  def create
      @toy = Toy.new(toy_params)
      @toy.user = current_user
      if @toy.save
          redirect_to toys_path, notice: 'Toy successfully created!!'
      else
          render :new, status: :unprocessable_entity

      end
  end

  def update
      #find_toy
      if @toy.update(toy_params)
          redirect_to toys_path, notice: 'Toy successfully updated!!'
      else
          render :edit, status: :unprocessable_entity
      end
      
  end

  def destroy
      #find_toy
      @toy.destroy
      redirect_to root_path, notice: 'Toy successfully deleted!!'
  end

  private
  def toy_params
    params.require(:toy).permit(:toyname, :content, :price)
  end

  def find_toy
    @toy = Toy.find_by(id: params[:id])
  end
end
