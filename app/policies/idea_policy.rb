class IdeaPolicy < ApplicationPolicy

  def update?
    user.has_role?(:admin) || record.user_id == user.id
    #or not record.published?
  end
end