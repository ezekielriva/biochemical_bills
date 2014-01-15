class Admin::OrdersController < AdminController

  expose(:orders) { Order.where(bill_id: params[:bill_id]) }
  expose(:order, attributes: :order_params)
  expose(:order_lines) { order.order_lines }

  def index; end
  def new
    3.times { order_lines.build }
  end

  def create
    if order.save
      redirect_to admin_bill_orders_path,
                  success:'The Order was created successfully'
    else
      render :new
    end
  end

  def update
    if order.save
      redirect_to admin_bill_orders_path,
                  success:'The Order was updated successfully'
    else
      render :new
    end
  end

  private
    def order_params
      params.require(:order).permit(:id, :patient_no, :patient_name,
        order_lines_attributes:[:id, :quantity, :bio_practice_id, :_destroy])
    end

end
