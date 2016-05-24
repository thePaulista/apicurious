class OctocatService
  attr_reader :user

  def initialize(user)
    @user = user
    @conn = Faraday.get("https://api.github.com")
  end

  def get_followers
  end

end
