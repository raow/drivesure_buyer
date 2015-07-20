class Ability
  include CanCan::Ability

  	def initialize(user)
  		if user.blank?
  			cannot :manage, :all
  		elsif user.role == 'admin'
  			can :manage, :all
  		else
  			can :manage, Service, :dealer_id => user.dealer_id
  			can :create, Service
  			can :manage, Car
        can :manage, Driver
        can :manage, Buyer
  		end
	end
end