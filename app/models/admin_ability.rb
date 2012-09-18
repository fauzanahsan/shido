# app/models/admin_ability.rb

# All back end users (i.e. Active Admin users) are authorized using this class
class AdminAbility
  include CanCan::Ability

  def initialize(admin_user)
    admin_user ||= AdminUser.new

    # We operate with three role levels:
    #  - Editor
    #  - Moderator
    #  - Manager

    # An editor can do the following:
    #can :manage, Foobar
    #can :read, SomeOtherModel

    # A moderator can do the following:
    if admin_user.has_role? :admin
      can :manage, :all
    end

    # A manager can do the following:
    if admin_user.has_role? :sales
      can :manage, Order
    end
    
    if admin_user.has_role? :account_manager
      can :manage, Order 
      can :manage, Business
      can :manage, CampaignTask
      can :manage, ProductionTask
      can :manage, User
    end
  end
end