class GithubService
 attr_reader :user, :conn
  def initialize(user)
    @user = user
    @conn =  Faraday.new(url: "https://api.github.com/users/")
    @conn.headers["Authorization"] = "token #{current_user.access_token}"
  end

  def get_followers
    conn.get("#{user.login}/followers")
  end

  def followers_hash
    parse(get_followers)
  end

  def get_following
    conn.get("#{user.login}/following")
  end

  def following_hash
    parse(get_following)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
