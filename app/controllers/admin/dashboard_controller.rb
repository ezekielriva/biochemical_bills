class Admin::DashboardController < AdminController
  expose(:bills) { Bill.all.order(month: :desc).limit(10) }

  def show; end
end
