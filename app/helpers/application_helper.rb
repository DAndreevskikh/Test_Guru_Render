module ApplicationHelper
  def current_year
    Time.current.year
  end

 def github_url(author, repo)
  link_to repo, "https://github.com/DAndreevskikh/Test_Guru#{author}/#{repo}", target: '_blank', rel: 'noopener'
 end
end
