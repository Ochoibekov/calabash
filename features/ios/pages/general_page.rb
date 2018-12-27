require 'calabash-cucumber/ibase'

class GeneralPage < Calabash::IBase

  def assert_app_is_runned
    wait_for do
      !query("*").empty?
      url = ENV["IOS_SERVER_URL"]
      if url != nil
        backdoor("calabashBackdoorSetApiUrlWithParams:", ENV["IOS_SERVER_URL"])
      end  
    end
  end
  
end

