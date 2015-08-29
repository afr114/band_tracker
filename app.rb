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

patch '/bands/:id' do
  @band = Band.find(params.fetch("id").to_i())
  name = params.fetch("name")
  @band.update({:name => name})
  redirect "/bands/#{@band.id}"
end

delete '/bands/:id' do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  @band.destroy
  redirect("/bands")
end

get '/venues' do
  erb(:venues)
end

post '/venues' do
  @venue = Venue.create({ name: params['name']})
  redirect "/venues"
end

delete '/venues/:id' do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  @venue.destroy
  redirect("/venues")
end

get '/bands/:id/venue/new' do
  @venues = Venue.all
  @band = Band.find(params['id'].to_i)
  erb(:band_venue)
end

post '/bands/:id/venues' do
  @band = Band.find(params['id'].to_i)
  @venue = Venue.create({name: params['venue_name']})
  @band.venues.push(@venue)
  redirect "/bands/#{@band.id}"
end
