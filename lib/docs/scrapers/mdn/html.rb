module Docs
  class Html < Mdn
    prepend FixInternalUrlsBehavior

    # release = '2021-12-21'
    self.name = 'HTML'
    self.base_url = 'https://developer.mozilla.org/en-US/docs/Web/HTML'

    html_filters.push 'html/clean_html', 'html/entries'

    options[:root_title] = 'HTML'

    options[:skip] = %w(
      /index
      /Element/shadow
      /Element/webkit-meter-optimum-value
    )

    options[:replace_paths] = {
      '/Element/h1' => '/Element/Heading_Elements',
      '/Element/h2' => '/Element/Heading_Elements',
      '/Element/h3' => '/Element/Heading_Elements',
      '/Element/h4' => '/Element/Heading_Elements',
      '/Element/h5' => '/Element/Heading_Elements',
      '/Element/h6' => '/Element/Heading_Elements',
      '/Global_attributes/data-%2A' => '/Global_attributes/data-*' }

    options[:fix_urls] = ->(url) do
      url.sub! 'https://developer.mozilla.org/en-US/docs/HTML/', "#{Html.base_url}/" unless url.include?('Content_categories')
      url
    end

  end
end
