ENV['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('rspec')
require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

require('./app')

RSpec.configure do |config|
  config.after(:each) do
    Band.all.each do |task|
      task.destroy
    end
    Venue.all.each do |task|
      task.destroy
    end
  end
end
