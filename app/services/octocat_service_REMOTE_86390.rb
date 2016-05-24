class OctocatService
  attr_reader :user

  def initialize(user)
    @user = user
    @conn = Faraday.get("https://api.github.com")
  end

  def page_data
    get_followers
    get_following
    get_starred
  end

  def followers
  end

  def get_following
  end

  def get_starred
  end
end
