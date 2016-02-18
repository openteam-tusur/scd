module CmsRequest
  extend ActiveSupport::Concern

  def cms_request(action_name)
      RestClient::Request.execute({
        method: :get,
        url: "#{Settings['cms.url']}/nodes/scd/ru/#{action_name}.json",
        content_type: 'application/json',
        accept: 'application/json',
        timeout: 1
      }) do |response, request, result|
        if result.code == '200'
          #get result and cache it if all works
          json = JSON.parse response
          @content = json["page"]["regions"]["content"]["content"]["body"].html_safe
          Rails.cache.write "#{params['controller']}-#{action_name}", @content
        else
          #get information from cache if response was failed
          @content = Rails.cache.fetch "#{params['controller']}-#{action_name}"
        end
      end
  end
end
