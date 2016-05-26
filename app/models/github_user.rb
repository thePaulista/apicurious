class GithubUser < OpenStruct
  attr_reader :service

  def initialize(user)
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
    mssg_array = []
    service.events_hash.select do |event|
      if event[:type] == "PushEvent"
        message_count =  event[:payload][:commits].count
        message_count.times.map do |n|
          mssg_array <<  event[:payload][:commits][n][:message]
        end
      end
    end
    mssg_array
  end

 # def lookup_followers_events
 #   service.get_followers_events.select |event|
 #   if event.first[:type] == "PushEvent"
 #    x = event.first[:payload][:commits].first[:message]
 #    x.nil? ? super : x
 #   end
 # end
end

