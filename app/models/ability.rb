class Ability #begin by defining user permissions w the ability class
    include CanCan::Ability

    def initialize(user) #initialize method takes in user obj as a param
        user ||= User.new #guest user (not logged in)
        if user.admin?
        	can :manage, :all
        else
        	can :manage, User, id: user.id
        end
        #can :manage, User, id: user.id #manage is the action to the CAN argument
    end

end