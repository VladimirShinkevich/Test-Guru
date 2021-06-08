# frozen_string_literal: true

module ApplicationHelper
  ALERTS = { alert: "danger", notice: "success" }.freeze

  def curent_year
    Time.current.year
  end

  def github_url(author:, repo:)
    link_to 'Project TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash_message(type)
    tag.p(flash[type], class: "flash #{type}") if flash[type]
  end

  def alert_type(key)
    ALERTS[key.to_sym]
  end
end
