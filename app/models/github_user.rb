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
    service.events_hash.select do |event|
      if event[:type] == "PushEvent"
        mssg_array = []
        message_count =  event[:payload][:commits].count
        message_count.times do |n|
          mssg_array <<  event[:payload][:commits][n][:message]
        end
      end
    mssg_array
    end
  end

  def lookup_received_events
  end

end
