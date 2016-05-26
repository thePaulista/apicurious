class GithubService
  def initialize(user)
    @conn =  Faraday.new(url: "https://api.github.com/users/#{user.nickname}")
    @conn.headers["Authorization"] = "token #{user.oauth_token}"
  end

  def get_followers
    conn.get("followers")
  end

  def followers_hash
    parse(get_followers)
  end

  def get_following
    conn.get("following")
  end

  def following_hash
    parse(get_following)
  end

  def get_starred
    conn.get("starred")
  end

  def starred_hash
    parse(get_starred)
  end

  def get_organizations
    conn.get("orgs")
  end

  def organizations_hash
    parse(get_organizations)
  end

  def get_repos
    conn.get("repos")
  end

  def repos_hash
    parse(get_repos)
  end

  def get_events
    conn.get("events")
  end

  def events_hash
    parse(get_events).select {|event| event[:type] == "PushEvent"}
  end

  def get_received_events
    conn.get("received_events")
  end

  def received_events_hash
    parse(get_received_events)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    @conn
  end
end
