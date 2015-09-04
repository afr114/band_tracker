require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname('__FILE__') + '/lib/*.rb'].each{ |file| require file }
require('pry')

get '/'  do
  erb(:index)
end

get '/bands' do
  erb(:bands)
end

post '/bands' do
  name = params.fetch('name')
  Band.create({:name => name})
  redirect "/bands"
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

patch '/bands/:id/venue' do
  @band = Band.find(params.fetch("id").to_i())
  venue = Venue.find(params.fetch("venue_id").to_i())
  @bands = Band.find(params.fetch("id").to_i())
  @bands.venues.push(venue)
  redirect "/bands/#{@band.id}"
end
