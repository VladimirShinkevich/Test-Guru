# frozen_string_literal: true

module ApplicationHelper
  def curent_year
    Time.current.year
  end

  def github_url(author:, repo:)
    link_to 'Project TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash_message(type)
    tag.p(flash[type], class: "flash #{type}") if flash[type]
  end
end
