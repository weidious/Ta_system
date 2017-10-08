When(/^I go to the homepage$/) do
  visit "http://127.0.0.1:3000/"
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome")
end
