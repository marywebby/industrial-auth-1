class CommentPolicy < ApplicationPolicy
  attr_reader :comment, :user

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def initialize(user, comment)
    @comment = comment
    @user = user
  end

  def edit?
    user == comment.author
  end 

  def create?
    true
  end

  def update?
    edit?
  end 

  def destroy?
    edit?
  end
end
