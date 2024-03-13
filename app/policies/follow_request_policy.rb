class FollowRequestPolicy < ApplicationPolicy
  attr_reader :follow_requests, :user

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def initialize(user, follow_requests)
    @follow_requests = follow_requests
    @user = user
  end

  def create?
    true
  end

  def update?
    user == follow_requests.recipient || follow_requests.sender
  end 

  def destroy?
    update? 
  end

end
