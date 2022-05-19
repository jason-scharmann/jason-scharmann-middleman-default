# data.layout.title defined in data/layout/base.yml

module PageTitle
  def page_title(title)
    base = data.layout.base.title
    if title.nil?
      base
    else
      title + " • " + base
    end
  end
end
