require 'spec_helper'

feature "Admin Signin" do
  given(:admin) { create(:admin) }
  scenario 'with valid data' do
    login_with(admin)
    visit admin_dashboard_path

    expect(current_path).to eql admin_dashboard_path
  end
end