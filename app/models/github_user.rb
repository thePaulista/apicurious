class GithubUser < OpenStruct
  def self.service
    GithubService.new
  end

  def self.find(id)
    temp_user_hash = service.user_hash(id)
    GithubUser.new(temp_user_hash)
  end

  def self.all
    temp_users_hash = service.users_hash
    temp_users_hash.map do |temp_user_hash|
      GithubUser.new(temp_user_hash)
    end
  end

  def self.lookup_followers
    service.followers_hash
  end

  def self.lookup_following
    service.following_hash
  end

  def self.lookup_starrred
    service.starred_hash
  end

end
