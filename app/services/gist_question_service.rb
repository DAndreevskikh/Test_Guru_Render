class GistQuestionService

	def initialize(question, client: nil)
		@question = question
		@test = @question.test
		@client = client || GitHubClient.new
	end

	def call
	  response = @client.create_gist(gist_params)
      OpenStruct.new(success?: response.present?, html_url: response.html_url)
	end 

	private

	def gist_params
	  {
		 description: I18n.t('services.gist_question_service.description', title: @test.title),
		 files: {
		   'test-guru-question.txt' => {
			content: gist_content
	     }
	   }
	 }
	end

	def gist_content
      content = [@question.body]
      content += @question.answers.pluck(:body)
      content.join("\n")
   end
end
