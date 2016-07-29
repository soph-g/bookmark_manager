feature 'Resetting password' do

  scenario 'When I forget my password I can see a link to reset' do
    visit '/sessions/new'
    click_link("I forgot my password")
    expect(page).to(have_content("Please enter your email address"))
  end

  scenario 'When I enter my email address I am told to check my inbox' do
    recover_password
    expect(page).to(have_content("Thanks, please check your inbox for the link."))
  end

  scenario 'assigned a reset token to the user when they recover' do
    sign_up
    expect{ recover_password }.to(change{User.first.password_token})
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: "alice@example.com"
    click_button("Submit")
  end

end
