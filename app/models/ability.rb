class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, Recipe

    return unless user.is_a?(User) && user.id.present?

    can :manage, Recipe, user_id: user.id
  end
end
