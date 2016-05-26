class GithubUser
  attr_reader :user, :service

  def initialize(user)
    @user = user
    @service  = GithubService.new(user)
  end

  def lookup_followers
    service.followers_hash
  end

  def lookup_following
    service.following_hash
  end

  def lookup_starred
    service.starred_hash
  end

  def lookup_organizations
    service.organizations_hash
  end

  def lookup_repos
    service.repos_hash
  end

  def lookup_events
    service.events_hash
  end

  def lookup_received_events
    service.received_events_hash
  end

end
