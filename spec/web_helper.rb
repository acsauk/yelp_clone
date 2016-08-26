def sign_up(email: 'test@test.com', password: 'password123')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_out
  click_link 'Sign out'
end

def create_restaurant(name: 'KFC')
  visit '/'
  click_link 'Add a restaurant'
  fill_in 'Name', with: name
  click_button 'Create Restaurant'
end

def leave_review(thoughts, rating)
  visit '/'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
