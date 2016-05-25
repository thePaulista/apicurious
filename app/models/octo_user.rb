class OctoUser < OpenStruct
  def self.service
    GithubService.new
  end
end
