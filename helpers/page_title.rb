module PageTitle
    def page_title(title)
    base_title = "Document"
    if title.nil?
      base_title
    else
      title + " • " + base_title
    end
  end
end
