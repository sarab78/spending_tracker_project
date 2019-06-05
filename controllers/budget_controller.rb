require ( 'sinatra' )
require ( 'sinatra/contrib/all' )
require_relative('../models/budget.rb')
also_reload('../models/*')

get "/budgets" do
  @budget = Budget.all().first.amount
  erb(:"budget/index")

end

  
