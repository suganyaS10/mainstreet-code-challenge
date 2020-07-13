require "test_helper"
require "application_system_test_case"

class CompaniesControllerTest < ApplicationSystemTestCase

  def setup
    @company = companies(:hometown_painting)
  end

  test "Index" do
    visit companies_path

    assert_text "Companies"
    assert_text "Hometown Painting"
    assert_text "Wolf Painting"
  end

  test "Show" do
    visit company_path(@company)

    assert_text @company.name
    assert_text @company.phone
    assert_text @company.email
    assert_text @company.city
    assert_text @company.state
  end

  test "Update" do
    visit edit_company_path(@company)

    within("form#edit_company_#{@company.id}") do
      fill_in("company_name", with: "Updated Test Company")
      fill_in("mainstreet-email", with: "new_test_company@getmainstreet.com")
      fill_in("company_zip_code", with: "93009")
      click_button "Update Company"
    end

    assert_text "Changes Saved"
    @company.reload
    assert_equal "Updated Test Company", @company.name
    assert_equal "new_test_company@getmainstreet.com", @company.email
    assert_equal "93009", @company.zip_code
    assert_equal "Ventura", @company.city
    assert_equal "California", @company.state
  end

  test "Update with Invalid Email" do
    visit edit_company_path(@company)

    within("form#edit_company_#{@company.id}") do
      fill_in("company_name", with: "Updated Test Company")
      fill_in("mainstreet-email", with: "new_test_company@test.com")
      fill_in("company_zip_code", with: "93009")
      click_button "Update Company"
    end
    assert_selector "div#alert_message", text: 'Email must be a getmainstreet.com account'
  end

  test "Create" do
    visit new_company_path

    within("form#new_company") do
      fill_in("company_name", with: "New Test Company")
      fill_in("company_zip_code", with: "28173")
      fill_in("company_phone", with: "5553335555")
      fill_in("mainstreet-email", with: "new_test_company@getmainstreet.com")
      click_button "Create Company"
    end

    assert_text "Saved"

    last_company = Company.last
    assert_equal "New Test Company", last_company.name
    assert_equal "28173", last_company.zip_code
    assert_equal "Waxhaw", last_company.city
    assert_equal "North Carolina", last_company.state
  end

  test "destroy" do
    companies_count = Company.count
    visit company_path(@company)
    accept_confirm do
      click_on "Delete"
    end

    assert_text "Company Deleted successfully"

    assert_equal (companies_count - 1), Company.count
  end

end
