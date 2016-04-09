module AvatarHelper
  def default_avatar_url(identifier, size = 100)
    "https://api.adorable.io/avatars/#{size}/#{identifier}.png"
  end
end
