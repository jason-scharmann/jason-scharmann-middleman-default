# data.layout.title defined in data/layout.yml

module PageTitle
  def page_title(title)
    base = data.layout.title
    if title.nil?
      base
    else
      title + " • " + base
    end
  end
end
