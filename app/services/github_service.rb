class GithubService

  def initialize(user)
    @user = user
    @conn =  Faraday.new(url: "https://api.github.com/users/")
    @conn.headers["Authorization"] = "token #{user.oauth_token}"
 end

  def get_followers
    @conn.get("#{@user.nickname}/followers")
  end

  def followers_hash
    parse(get_followers)
  end

  def get_following
    @conn.get("#{@user.nickname}/following")
  end

  def following_hash
    parse(get_following)
  end

  def get_starred
    @conn.get("#{@user.nickname}/starred")
  end

  def starred_hash
    parse(get_starred)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
