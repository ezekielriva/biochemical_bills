class Admin::BioPracticesController < AdminController
  expose(:bio_practices)
  expose(:bio_practice, attributes: :bio_practice_params)

  def index; end
  def new; end

  def create
    if bio_practice.save
      redirect_to admin_bio_practices_path,
                  success:'The Bio Practice was created successfully'
    else
      render :new
    end
  end

  private
    def bio_practice_params
      params.require(:bio_practice).permit(:id, :name, :ub)
    end
end
