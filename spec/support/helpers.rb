def login_refinery_user
  password = '123456'
  refinery_user = FactoryGirl.create :refinery_user, {
    username:              'refinerycms',
    email:                 'refinerycms@refinerycms.com',
    password:              password,
    password_confirmation: password
  }

  visit refinery.new_refinery_user_session_path

  fill_in 'Login',    with: refinery_user.username
  fill_in 'Password', with: password

  click_button 'Sign in'
end

def select_from_chosen(item_text, options)
  field  = first(options[:from])
  option = field.first('option', text: item_text, visible: false)

  option_value = option[:value]

  page.execute_script("value = ['#{option_value}']\; if ($('##{field[:id]}').val()) {$.merge(value, $('##{field[:id]}').val())}")

  option_value = page.evaluate_script("value")

  page.execute_script("$('##{field[:id]}').val(#{option_value})")
  page.execute_script("$('##{field[:id]}').trigger('liszt:updated').trigger('change')")
end
