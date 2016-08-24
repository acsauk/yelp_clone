require 'rails_helper'

feature "User can sign in and out" do
  context 'user not signed in on the homepage' do
    it 'should see a "sign in" link and a "sign up" link'do
      visit '/'
      expect(page).to have_link("Sign in")
      expect(page).to have_link("Sign up")
    end

    it 'should not see sign out link' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'user signed in on the homepage' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: "samed@hotmail.de"
      fill_in 'Password', with: "1234abc"
      fill_in 'Password confirmation', with: "1234abc"
      click_button ('Sign up')
    end

    it 'should see the sign out link' do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    it 'should not see the sign in and sign up links' do
      visit '/'
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context 'user not signed in' do
    it 'cannot create restaurants' do
      visit '/'
      click_link 'Add a restaurant'
      expect(page).to have_content('Log in')
    end
  end
end
