require "spec_helper"

feature "New Bill" do
  given(:bill) { build(:bill) }
  
  scenario "with valid data" do
    visit '/admin/bills/new'

    fill_in 'bill[multiplier]', with:bill.multiplier
    fill_in 'bill[month]',      with:bill.month
    find_button('Create').click

    expect( Bill.all ).not_to be_empty
    expect( Bill.where(month:bill.month) ).to exist
  end

  scenario "with invalid data" do
    visit '/admin/bills/new'

    find_button('Create').click

    expect( Bill.all ).to be_empty

    expect(page).to have_content "Multiplier is not a number"
    expect(page).to have_content "Multiplier can't be blank"
    expect(page).to have_content "Month can't be blank"
  end
end
