class ImportsController < ApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]

  def index
    @imports = current_user.imports.all
  end

  def show
  end

  def new
    @import = current_user.imports.new
  end

  def edit
  end

  def create
    @import = current_user.imports.new(import_params)
    respond_to do |format|
      if @import.save
        # ExcelUploadJob.set(wait: 0.seconds).perform_later(@file_upload)
     
        ImportContactJob.set(wait: 0.seconds).perform_later(@import.id)
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_import
      @import = current_user.imports.find(params[:id])
    end

    def import_params
      params.require(:import).permit(
                                      :user_id,
                                      :upload,
                                      :status,
                                      :number_of_success,
                                      :number_of_failed,
                                      :total_record,
                                      :failure_reason
                                    )
    end
end
