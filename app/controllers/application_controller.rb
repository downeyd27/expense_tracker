class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Change site_name"
    title       = [controller_name, action_name].join(" ")
    description = "Change description"
    image       = options[:image] || "../assets/images/CHANGE.DEFAULT.jpg"
    current_url = request.url

    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[web software development app junior developer front-end back-end Front-End Back-End Full-Stack full-stack engineer ],
      twitter: {
        card: 'summary',
        site: '@downeydillon1',
        title: title,
        description: description,
        image: image
      },
     og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }
    options.reverse_merge!(defaults)
    set_meta_tags options
  end
end
