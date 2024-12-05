class ClimbingPlacePolicy < ApplicationPolicy
  def new?
    @user.present?
  end

  def edit?
    @user.present? && @user == @record.user
  end

  def create?
    @user.present?
  end

  def update?
    @user.present? && @user == @record.user
  end

  def destroy?
    @user.present? && @user == @record.user
  end
end
