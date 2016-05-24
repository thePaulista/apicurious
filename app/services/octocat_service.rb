class OctocatService
  attr_reader :user

  def self.find(user)
    @user = user
  end

  def get_followers
    followers = "https://api.github.com/user/#{user.login}/followers"
    response = Faraday.get(followers)
    JSON.parse(response.body)
  end

end
