class GithubService< OpenStruct
  attr_reader :user

  def self.find(user)
    @user = user
    @conn =  Faraday.new(url: "https://api.github.com")
    #@conn.headers["Authorization"] #put the token here?
  end

end
