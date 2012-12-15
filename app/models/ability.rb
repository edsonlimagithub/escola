class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user.role? :administrador
      can :manage, :all
    elsif user.role? :operador  
      can :manage, :alunos
    end
  end
end