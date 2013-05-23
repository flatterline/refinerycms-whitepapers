require 'spec_helper'

feature %Q{
 As a User
 ISBAT create a whitepaper
} do

  before do
    login_refinery_user
  end

  scenario 'New whitepaper page, existing file', js: true do
    existing_file = FactoryGirl.create :resource
    visit refinery.new_admin_page_path

    fill_in 'Title', with: 'Whitepaper page'

    first('#custom_Whitepaper_tab a').click
    select_from_chosen(existing_file.title, from: '#page_whitepaper_page_resource_id')

    click_button 'Save'

    page = Refinery::Page.by_title('Whitepaper page').first

    whitepaper_page = page.whitepaper_page
    expect(whitepaper_page).to be_present
    expect(whitepaper_page.resource_id).to eq(existing_file.id)
  end

  scenario 'New whitepaper page, new file', js: true do
    visit refinery.new_admin_page_path

    fill_in 'Title', with: 'Whitepaper page'

    first('#custom_Whitepaper_tab a').click
    click_link 'Upload new whitepaper'

    page.should have_selector 'iframe#dialog_iframe'

    page.within_frame('dialog_iframe') do
      attach_file "resource_file", Refinery.roots(:'refinery/resources').join("spec/fixtures/refinery_is_awesome.txt")
      click_button ::I18n.t('save', scope: 'refinery.admin.form_actions')
    end

    sleep 1
    select_from_chosen('Refinery Is Awesome', from: '#page_whitepaper_page_resource_id')

    click_button 'Save'

    page = Refinery::Page.by_title('Whitepaper page').first

    whitepaper_page = page.whitepaper_page
    expect(whitepaper_page).to be_present
    expect(whitepaper_page.resource_id).to eq(Refinery::Resource.where(file_name: 'refinery_is_awesome.txt').first.id)
  end

  scenario 'Existing page, existing file', js: true do
    existing_page = FactoryGirl.create :page
    existing_file = FactoryGirl.create :resource
    visit refinery.edit_admin_page_path(existing_page)

    first('#custom_Whitepaper_tab a').click
    select_from_chosen(existing_file.title, from: '#page_whitepaper_page_resource_id')

    click_button 'Save'

    existing_page.reload

    whitepaper_page = existing_page.whitepaper_page
    expect(whitepaper_page).to be_present
    expect(whitepaper_page.resource_id).to eq(existing_file.id)
  end

  scenario 'Existing page, new file', js: true do
    existing_page = FactoryGirl.create :page
    visit refinery.edit_admin_page_path(existing_page)

    first('#custom_Whitepaper_tab a').click
    click_link 'Upload new whitepaper'

    page.should have_selector 'iframe#dialog_iframe'

    page.within_frame('dialog_iframe') do
      attach_file "resource_file", Refinery.roots(:'refinery/resources').join("spec/fixtures/refinery_is_awesome.txt")
      click_button ::I18n.t('save', scope: 'refinery.admin.form_actions')
    end

    sleep 1
    select_from_chosen('Refinery Is Awesome', from: '#page_whitepaper_page_resource_id')

    click_button 'Save'

    existing_page.reload

    whitepaper_page = existing_page.whitepaper_page
    expect(whitepaper_page).to be_present
    expect(whitepaper_page.resource_id).to eq(Refinery::Resource.where(file_name: 'refinery_is_awesome.txt').first.id)
  end
end
