require 'calabash-cucumber/launcher'

module Calabash::Launcher
  @@launcher = nil
  def self.launcher
    @@launcher ||= Calabash::Cucumber::Launcher.new
  end
  def self.launcher=(launcher)
    @@launcher = launcher
  end
end


Before('@reset_app_sandbox') do
  ENV['RESET_BETWEEN_SCENARIOS'] = '1'
end


Before('@dont_quit_after') do
  ENV['QUIT_APP_AFTER_SCENARIO'] = '0'
end

Before do |scenario|
  scenario_tags = scenario.source_tag_names
  if !scenario_tags.include?('@dont_relaunch_sumulator_before')
    
    RunLoop::CoreSimulator.quit_simulator
    sleep 3
    RunLoop::CoreSimulator.quit_simulator
    sleep 3

    launcher = Calabash::Launcher.launcher
    options = {
      # Add launch options here.
    }
    launcher.relaunch(options)
  else
    # launcher = Calabash::Launcher.launcher
    # launcher.console_attach
  end

  ENV['RESET_BETWEEN_SCENARIOS'] = ''
end

After do |scenario|
  # Calabash can shutdown the app cleanly by calling the app life cycle methods
  # in the UIApplicationDelegate.  This is really nice for CI environments, but
  # not so good for local development.
  #
  # See the documentation for QUIT_APP_AFTER_SCENARIO for a nice debugging workflow
  #
  # http://calabashapi.xamarin.com/ios/file.ENVIRONMENT_VARIABLES.html#label-QUIT_APP_AFTER_SCENARIO
  # http://calabashapi.xamarin.com/ios/Calabash/Cucumber/Core.html#console_attach-instance_method

  if launcher.quit_app_after_scenario?
    calabash_exit
  end
  ENV['QUIT_APP_AFTER_SCENARIO'] = '1'

  RunLoop::CoreSimulator.quit_simulator

end

