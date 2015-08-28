require 'sinatra/activerecord'
require 'sinatra'
require 'pg'
require 'sinatra/reloader'
require 'pry'
require './lib/band'
require './lib/venue'

get '/'  do
  erb(:index)
end

get '/bands' do
  erb(:bands)
end
