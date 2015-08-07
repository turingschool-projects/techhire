class StaticTemplateRenderer
  attr_reader :page

  def initialize(page)
    @page = page
  end

  def render
    rendered = @page.template
                    .gsub("$NAME", @page.name)
                    .gsub(/\$LOCATION(\d+)/) { |n| content_for $1.to_i }

    if rendered.include?('<%')
      raise "Not Good. There's erb in this template: #{rendered.inspect}"
    end

    rendered
  end

  def content_for(location)
    content = page.content_for(location)
    body    = content.body
    body
  end
end
