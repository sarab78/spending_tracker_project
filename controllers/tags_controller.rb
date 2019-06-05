require( 'sinatra')
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/tags')
also_reload('../models/*')

#INDEX
get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

#NEW
get '/tag/new' do
  @tags = Tag.all()
  erb(:"tags/new")
end

#CREATE
post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.save
  redirect to ("/tags")
end

#SHOW
get '/tags/:id' do
@transactions = Transaction.all()
@tag = Tag.find(params['id'].to_i)
  erb(:"tags/show")
end

#EDIT
get '/tags/:id/edit' do
  @tag = Tag.find(params[:id].to_i)
  erb(:"tags/edit")
end

#UPDATE
post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update
  redirect to("/tags")
end

#DELETE
post '/tags/:id/delete' do
  @tag = Tag.find(params[:id].to_i)
  # binding.pry
  @tag.delete()
  redirect to("/merchants")
end
