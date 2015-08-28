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

post '/bands' do
  @band = Band.create({ name: params['name']})
  redirect "/bands/#{@band.id}"
end

get '/bands/:id' do
  @band = Band.find(params['id'].to_i)
  erb(:band)
end

get '/bands/:id/edit' do
  @band = Band.find(params['id'].to_i)
  erb(:band_edit)
end

get '/bands/:id/delete' do
  @band = Band.find(params['id'].to_i)
  @band.destroy
  redirect "/bands"
end

patch '/bands/:id' do
  @band = Band.create({ name: params['name'] })
  redirect "/bands/#{@band.id}"
end
