require 'rails_helper'

describe 'products', type: :feature do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before do
  	set_subdomain(account.subdomain)
  	sign_user_in(user)
  end

  it 'allows products to be created' do
  	visit root_path
  	click_link "New Product"

  	fill_in "Name", with: "A great product"
  	fill_in "Price", with: 23.50
  	fill_in "Client", with: "Tangier Rock"
  	expect(page).to_not have_text "Archived"
  	click_button "Create Product"

  	expect(page).to have_text "Product created!"
  	expect(page).to have_text "A great product"
  end

  it "displays product validation" do
  	visit root_path
  	click_link "New Product"

  	click_button "Create Product"
  	expect(page).to have_text "can't be blank"
  end

  it 'allows products to be edited' do
  	product = create(:product)
  	visit root_path
  	click_edit_product_button product.name

  	fill_in "Name", with: "A new name"
  	check "Archived"
  	click_button "Update Product"

  	expect(page).to have_text "Product updated!"
  	expect(page).to have_text "A new name"
  end

  def click_edit_product_button(product_name)
  	within find("h3", text: product_name) do
  	  page.first("a").click
  	end
  end
end