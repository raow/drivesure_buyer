#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dealer = Dealer.create(:name =>'CAA',:address => 'Shanghai', :contact => 'Czhang', :telephone => '13888888888')
#User.create!(:email => "admin@test.com", :password => "123123123", :role => "admin", :password_confirmation => "123123123")
User.create!(:email => "caa@test.com", :password => "123123123", :role => "admin", :password_confirmation => "123123123", 
	:dealer_id =>dealer.id)
car_models = {'美规 奔驰 GL350' => 27378,'美规 奔驰 ML300' => 27378,'美规 宝马 X5' => 22840, '美规 宝马 X6' => 24570,
'美规 卡宴' => 35100, '进口丰田 2700' => 11700 }

car_models.each do |key,value|
	car_model = CarModel.new
	car_model.name = key
	car_model.save

	pro = Product.new
	pro.coverage_period = 36
	pro.coverage_mile = 60000
	pro.car_model_id = car_model.id

	pro.fee = value
	pro.name = key.to_s + '  3年60000公里质保服务'
	pro.save
end