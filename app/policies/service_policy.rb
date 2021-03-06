class ServicePolicy < ApplicationPolicy
  attr_accessor :user, :record, :owner

  def initialize user, record, owner = nil
    @user = user
    @record = record
    @owner = owner
  end

  class Scope < Scope
    def resolve
      user.union_readable_services(user.groups)
    end
  end

  def update?
    user.writeable_services.include? record
  end

  def create?
    if owner.is_a?(Group)
      return user.groups.include? owner
    end

    if owner.is_a?(User)
      return owner == user
    end
  end

  def destroy?
    user.adminable_services.include? record
  end
end
