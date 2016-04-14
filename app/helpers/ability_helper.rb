module AbilityHelper
  def add_user_to_event
    # TODO(cab): Make rule to check if user is already in the event
    return false unless current_user
    true
  end

  def add_team_to_event
    # TODO(cab): Make rule to check if user is already in the team
    return false unless current_user
    true
  end

  def add_user_to_team
    # TODO(cab): Make rule to check if user is already in the team
    return false unless current_user
    true
  end
end
