require_relative( '../models/merchants.rb')
require_relative('../models/tags.rb')
require_relative('../models/transactions.rb')
require_relative('../models/budget.rb')
require('pry')
require('date')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


Budget.delete_all()


tag1 = Tag.new({
  "name" => "Groceries"
  })
  tag1.save()

tag2 = Tag.new({
    "name" => "Bills"
    })
tag2.save()

tag3 = Tag.new({
  "name" => "Entertainment"
  })
tag3.save()

tag4 = Tag.new({
  "name" => "Travel"
  })
tag4.save()

tag5 = Tag.new({
  "name" => "clothing"
  })
tag5.save()

  tag6 = Tag.new({
    "name" => "other"
    })
    tag6.save()

  tag7 = Tag.new({
    "name" => "Home"
    })
    tag7.save()

  tag8 = Tag.new({
  "name" => "Car Installment"
  })
  tag8.save()


merchant1 =  Merchant.new({
  "name" => "Tesco"
  })
merchant1.save()

merchant2 = Merchant.new({
  "name" => "Amazon"
  })
merchant2.save()

merchant3 = Merchant.new({
  "name" => "Next"
  })
  merchant3.save()

  merchant4 = Merchant.new({
    "name" => "British Gas"
    })
    merchant4.save()

merchant5 = Merchant.new({
  "name" => "Arnold Clark"
  })
merchant5.save()

merchant6 = Merchant.new({
  "name" => "Aldi"
  })
  merchant6.save()

  merchant7 = Merchant.new({
    "name" => "AirLine"
    })
  merchant7.save()

 merchant8 = Merchant.new({
    "name" => "Debanhams"
    })
 merchant8.save

 merchant9 = Merchant.new({
    "name" => "Sky"
    })
 merchant9.save

transaction1 = Transaction.new({
    "tag_id" =>  tag1.id,
    "merchant_id" => merchant1.id,
    "amount" => 60,
    "timestamp" => '04-06-2019'
    })
transaction1.save()

transaction2 = Transaction.new({
  "tag_id" => tag2.id,
  "merchant_id" => merchant4.id,
  "amount" => 200,
  "timestamp" => '15-05-2019'
  })
  transaction2.save()

  transaction3 = Transaction.new({
    "tag_id" => tag8.id,
    "merchant_id" => merchant5.id,
    "amount" => 250,
    "timestamp" => '30-05-2019'
    })
    transaction3.save()

  transaction4 = Transaction.new({
  "tag_id" => tag4.id,
  "merchant_id" => merchant7.id,
  "amount" => 2000,
  "timestamp" => '15-02-2019'
  })
  transaction4.save()

  transaction5 = Transaction.new({
    "tag_id" => tag7.id,
    "merchant_id" => merchant2.id,
    "amount" => 100,
    "timestamp" => '01-06-2019'
    })
    transaction5.save()

  transaction6 = Transaction.new({
  "tag_id" => tag6.id,
  "merchant_id" => merchant1.id,
  "amount" => 200,
  "timestamp" => '31-12-2018'
    })
  transaction6.save()

  transaction7 = Transaction.new({
    "tag_id" => tag3.id,
    "merchant_id" => merchant9.id,
    "amount" => 50,
    "timestamp" => '30-01-2019'
    })
transaction7.save()

transaction8 = Transaction.new({
  "tag_id" => tag5.id,
  "merchant_id" => merchant8.id,
  "amount" => 100,
  "timestamp" => '28-04-2019'
  })
  transaction8.save()

  transaction9 = Transaction.new({
    "tag_id" => tag1.id,
    "merchant_id" => merchant1.id,
    "amount" => 100,
    "timestamp" => '28-05-2019'
    })
  transaction9.save()

  budget1 = Budget.new({
    "amount" => 1000
  })

  budget1.save()


binding.pry
nil
