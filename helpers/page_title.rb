# data.layout.title defined in data/layout/base.yml

module PageTitle
  def page_title(title, base_title = data.layout.base.title)
    base = base_title
    if title.nil?
      base
    else
      title + " • " + base
    end
  end
end
