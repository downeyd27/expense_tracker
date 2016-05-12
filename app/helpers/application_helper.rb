module ApplicationHelper
  # Returns the full title on a per-page basis
  def base_title
    "Dillon Downey | Index"
  end

  def full_title(page_title)
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
