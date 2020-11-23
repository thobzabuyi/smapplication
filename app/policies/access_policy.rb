class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    # More privileged role, applies to registered users.
    #
    role :owner, proc { |owner| owner.role == 'owner'} do
    can [:create, :manage, :destroy], Manager
    can [:create], Store
    can :create, Section
    can :create, Group
    can :create, Item
    can :create, Owner
end

role :manager, proc { |manager| manager.role == 'manager'} do
    can :create, Section
    can :create, Group
    can :create, Item
    can :update, Manager
end

    # The base role with no additional conditions.
    # Applies to every user.
    #
  end
end
