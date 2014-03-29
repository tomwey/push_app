class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def render_header_list(h2, link_text, url)
   html = render(:partial => "common/header_list", 
                 :locals => { :h2 => h2, :link_text => link_text, :url => url }).join("\n").html_safe
   html
  end
  helper_method :render_header_list
  
end
