class Admin::BillsController < AdminController
  
  expose(:bills)
  expose(:bill, attributes: :bill_params)
  
  def index; end
  def new; end

  def create
    if bill.save
      redirect_to admin_bills_path(bill), success:'Bill was created successfully.'
    else
      render :new
    end
  end

  private
    def bill_params
      params.require(:bill).permit(:multiplier, :month)
    end
end