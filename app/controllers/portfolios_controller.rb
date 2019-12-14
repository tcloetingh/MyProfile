class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end 

  def new
    @port_item = Portfolio.new 
  end

  def create
    @port_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @port_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @port_edit_item = Portfolio.find(params[:id])
  end

  def update
    @port_edit_update = Portfolio.find(params[:id])
    respond_to do |format|
      if @port_edit_update.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_show = Portfolio.find(params[:id])
  end


end
