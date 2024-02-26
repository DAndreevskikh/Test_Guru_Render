module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def flash_message(type, tag: :p)
    message = flash[type]
    return if message.blank?

    content_tag tag, message, class: "flash #{type}"
  end
end
