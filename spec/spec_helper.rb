ENV['RACK_ENV'] = 'test'
require 'sinatra/activerecord'
require 'rspec'
require 'pg'

require './lib/band'
require './lib/venue'

require 'capybara/rspec'

require './app'

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
