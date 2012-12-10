class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrador
      can :manage, :all
    elsif user.role? :operador
      can :manage, Post
    else 
      can :read, :all
    end
  end
end