module ApplicationHelper
  def arrival_and_departure(claim)
    result = ''
    unless claim.already_in_tomsk
      %w(arrival departure).each do |kind|
        if claim.send("#{kind}_time".to_sym)
          result << kind.capitalize
          result << ": "
          result << l(claim.send("#{kind}_time".to_sym), format: "%d %B %Y, %I:%M %P")
          result << " by #{claim.send("#{kind}_transport".to_sym)}" if claim.send("#{kind}_transport".to_sym)
          result << '<br/>'
        end
      end
    else
      result << 'Resides in Tomsk'
    end
    result.html_safe
  end
end
