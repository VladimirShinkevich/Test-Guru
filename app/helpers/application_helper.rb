module ApplicationHelper
  def curent_year
  	Time.current.year
  end
  
  def github_url(author:, repo:)
    link_to "Project TestGuru", "https://github.com/#{author}/#{repo}", target: "_blank"
  end	

end
