class Admin::BioPracticesController < AdminController
  expose(:bio_practices)
  expose(:filters) { BioPractice.where("name like ? or id = ?",
                                       "%#{params[:query]}%", params[:query]) }
  expose(:bio_practice, attributes: :bio_practice_params)

  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render json:filters.to_json }
    end
  end
  def new; end

  def create
    if bio_practice.save
      redirect_to admin_bio_practices_path,
                  success:'The Bio Practice was created successfully'
    else
      render :new
    end
  end

  def update
    if bio_practice.save
      redirect_to admin_bio_practices_path,
                  success:'The Bio Practice was created successfully'
    else
      render :new
    end
  end

  def destroy
    bio_practice.destroy
    redirect_to admin_bio_practices_path,
                success:'Bio Practice was deleted successfully.'
  end

  private
    def bio_practice_params
      params.require(:bio_practice).permit(:id, :name, :ub)
    end
end
