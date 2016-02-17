class String

  def as_text
    require 'nokogiri'
    Nokogiri::HTML(self.gsub(%r{</?span.*?>}, '').gsub(/>/, '> ')).text.squish
  end

  def as_html
    self.gsub!('&#160;', ' ')
    self.gsub!('&quot;', '"')
    self.gsub!('&#34;', '"')
    self.gilensize.html_safe
  end

end
