module ApplicationHelper

  def render_partial_for_region(region, prefix = nil)
    prefix = "#{prefix}_" if prefix.present?
    if region && (region.response_status == 200 || !region.response_status?)
      partial = "regions/#{prefix}#{region.template}"
      render :partial => partial,
      :locals => { :object => region.content, :response_status => region.response_status }
    else
      render :partial => 'regions/error', :locals => { :region => region }
    end
  end

  def render_cms_navigation(hash, list_class = nil, item_class = nil)
    return '' if hash.nil? || hash.empty?
    content_tag :ul, :class => list_class do
      hash.map do |key, value|
        klass = []
        klass << item_class
        klass << 'active' if value['selected']
        klass << 'has_children' if value['children']
        klass = klass.delete_if(&:blank?).join(' ').squish
        klass = nil if klass.empty?
        content_tag :li, :class => klass do
          if value['title'] != 'Почему ТУСУР?'
            render_link_for_navigation(key, value) + render_cms_navigation(value['children'], list_class)
          else
            render_link_for_navigation(key, value)
          end
        end
      end.join.html_safe
    end
  end

  def render_link_for_navigation(klass, item)
    if item['external_link'].present?
      if item['external_link'].match(/\Ahttps?/)
        link_to item['title'], item['external_link'], :class => klass, :target => :_blank
      else
        link_to item['title'], item['external_link'], :class => klass
      end
    else
      link_to item['title'], item['path'], :class => klass
    end
  end

end
