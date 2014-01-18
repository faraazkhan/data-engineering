class DataImportsController < ApplicationController
  def new
  end

  def index
    @imports = DataImport.all
  end

  def show
    @import = DataImport.find(params[:id])
  end

  def create
    @import = DataImport.process params[:file]
    redirect_to data_import_path(@import)
  end
end
