require_relative( '../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require('pry')
require('date')

# Merchant.delete_all()
# Tag.delete_all()


tag1 = Tag.new({
  "name" => "Bills"
  })
  tag1.save()

tag2 = Tag.new({
    "name" => "Groceries"
    })
tag2.save()

merchant1 =  Merchant.new({
  "name" => "Amazon"
  })
merchant1.save()

merchant2 = Merchant.new({
  "name" => "Tesco"
  })
merchant2.save()





binding.pry
nil
