class GithubService
  def initialize(user)
    @user = user
    @conn =  Faraday.new(url: "https://api.github.com/users")
    @conn.headers["Authorization"] = "token #{user.oauth_token}"
  end

  def get_followers
    conn.get("#{user.nickname}/followers")
  end

  def followers_hash
    parse(get_followers)
  end

  def get_followers_events
    followers_hash.map do |name|
      name[:login]
    end.map do |login_name|
      parse(conn.get("#{login_name}/events"))
    end.flatten
  end

  def get_following
    conn.get("#{user.nickname}/following")
  end

  def following_hash
    parse(get_following)
  end

  def get_starred
    conn.get("#{user.nickname}/starred")
  end

  def starred_hash
    parse(get_starred)
  end

  def get_organizations
    conn.get("#{user.nickname}/orgs")
  end

  def organizations_hash
    parse(get_organizations)
  end

  def get_repos
    conn.get("#{user.nickname}/repos")
  end

  def repos_hash
    parse(get_repos)
  end

  def get_events
    conn.get("#{user.nickname}/events")
  end

  def events_hash
    parse(get_events)
  end

  def get_received_events
    conn.get("#{user.nickname}/received_events")
  end

  def received_events_hash
    parse(get_received_events)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private

  def user
    @user
  end

  def conn
   @conn
  end
end
