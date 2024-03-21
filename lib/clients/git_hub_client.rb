class GitHubClient

	ROOT_ENDPOINT = 'https://api.github.com'

	def initialize
		@client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
	end

	def create_gist(params)
      @client.create_gist(params)
  end

	private

	def setup_http_client
	  Faraday.new(url: ROOT_ENDPOINT)
	end
end
