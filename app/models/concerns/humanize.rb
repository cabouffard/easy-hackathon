module Humanize
  def full_name
    "#{first_name} #{last_name}"
  end
  alias name full_name
end
