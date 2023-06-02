class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(customer_id: user) # owner_id car on a changé la column user_id en owner_id
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.customer_id == user.id || user.admin # owner_id car on a changé la column user_id en owner_id
  end

  def destroy?
    record.customer_id == user.id || user.admin # owner_id car on a changé la column user_id en owner_id
  end
end
