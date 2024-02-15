module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def flash_message(tag, key, css_class)
    return unless flash[key]

    content_tag(tag, flash[key], class: css_class)
  end
end
