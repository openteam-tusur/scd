include ActionView::Helpers::TagHelper

desc "generates html file for using in schedule static page from schedule.yml"
task :generate_schedule => :environment do
  f = File.open("lib/schedule.yml")
  schedule = YAML.load f
  f.close

  result = ''
  nav = schedule.keys.map do |date|
    content_tag(:li, content_tag( :a, date, href: "##{date.underscore.parameterize("_")}",
                                 'aria-controls' => date.underscore.parameterize("_"),
                                 role: 'tab', data: { toggle: "tab"}
                                ).html_safe,
                                role: "presentation")
  end

  result << content_tag(:ul, nav.join().html_safe, class: "nav nav-tabs", 'role' => 'tablist')

  tab_panes = schedule.map do |date, list_of_events|
    content_tag :div, content_for_date(list_of_events).html_safe, id: date.underscore.parameterize("_"), role: 'tabpanel', class: "tab-pane fade"
  end
  result << content_tag(:div, tab_panes.join().html_safe, class: "tab-content")
  html = File.open("lib/generated_schedule.html", 'w')
  html.write result
  html.close
  puts "ready"
end

desc "generate comittee html"
task :generate_committee => :environment do
  include ActionView::Helpers::AssetTagHelper

  f = File.open("lib/committee.yml")
  committee = YAML.load f
  f.close

  result = ''
  result << content_tag(:div, content_tag(:h3, "International Scientific Committee").html_safe, class: "col-md-8 col-sm-10 col-md-offset-2 col-sm-offset-1")
  committee = committee['participants'].map do |member|
    res = ''
    res << (member['image'].blank? ? image_tag("https://storage.tusur.ru/files/39132/100-100/circle.png") : image_tag(member['image'].gsub(/\/\d+-\d+\//, '/100-100!mn/')))
    res << content_tag(:p, member['participant'].split("(").first)
    res << content_tag(:small, member['participant'].split("").last.gsub(')', '') )
    content_tag(:div, res.html_safe, class: 'participant-block')
  end
  result << content_tag(:div, committee.join("").html_safe, class: "col-md-8 col-sm-10 col-md-offset-2 col-sm-offset-1 participants")
  html = File.open("lib/generated_committee.html", 'w')
  html.write result
  html.close
  puts 'ready'
end


private
  def content_for_date(events)
    include ActionView::Helpers::AssetTagHelper

    r = ''
    events.each do |event|
      res = ''
      res << image_tag(event["image"].gsub(/\/\d+-\d+\//, '/100-100!mn/'), class: "rounded hidden-xs", alt: event["title"])
      res << "<div class='events'>"
      res << content_tag(:h4, "#{event["starts_at"]} - #{event["ends_at"]}", class: "timing")
      res << '<div class="title">'
      res << content_tag(:span, event["title"], class: "title")
      res << content_tag(:span, " - #{ event["reporter"]}", class: 'reporter') if event['reporter']
      res << ("</div>" * 2)
      r << content_tag(:li, res.html_safe)
    end
    content_tag :ul, r.html_safe
  end
