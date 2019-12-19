class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def react
    @react_port_items = Portfolio.react 
  end 

  def new
    @port_item = Portfolio.new 
    3.times { @port_item.technologies.build }
  end

  def create
    @port_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

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
    @portfolio_showww = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html {redirect_to portfolios_url, notice: 'Record was removed'}
    end
  end

end
