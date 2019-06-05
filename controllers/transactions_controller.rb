require('sinatra' )
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transactions.rb')
require_relative('../models/merchants.rb')
require_relative('../models/tags.rb')
also_reload('../models/*' )

#INDEX

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.calculate_total_amount()
  erb(:"transactions/index")
end

#NEW

get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:"transactions/new" )
end

  #CREATE

  post '/transactions' do
    params["amount"] = params["amount"].to_f
    transaction = Transaction.new(params)
    transaction.save
    redirect to("/transactions")
  end

#SHOW

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:"/transactions/show")
end

#EDIT

get '/transactions/:id/edit' do
  @tags = Tags.all()
  @merchants = Merchants.all()
  @transactions = Transactions.find(params['id'])
  erb(:"transactions/edit")
end

#UPDATE

post '/transactions/:id 'do
  params["amount"] = params["amount"].to_f
  @transactions = Transactions.new(params)
  @transactions.update
  redirect to ("/transactions")
end

#DELETE

post '/transactions/:id/delete' do
  transactions = Transaction.find(params['id'])
  transactions.delete
  redirect to ("/transactions")
end
