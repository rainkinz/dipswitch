class FakeUser
  attr_reader :username

  def initialize(username, is_admin = false)
    @username = username
    @admin = is_admin
  end

  def admin?
    @admin
  end
end
