When(/^the app has launched$/) do
  @current_page = page(GeneralPage).assert_app_is_runned
end

Then(/^remove ads from screen$/) do 
  @current_page = page(GeneralPage).remove_ads
end

Then(/^go to profile$/) do 
  @current_page = page(GeneralPage).goto_profile
end

Then(/^login$/) do 
  @current_page = page(GeneralPage).login
end

