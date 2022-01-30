# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can [:read, :update, :me], User, id: user.id

      if user.admin?
        can :manage, :all
      elsif user.employee?
        can :read, Form, sectors: { id: user.sector.id }
        can :read, Sector, id: user.sector.id
      end
    end
  end
end
