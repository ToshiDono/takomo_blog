module HasUserData
  def users_full_name
    "#{object.user.name} #{object.user.surname}"
  end
end
