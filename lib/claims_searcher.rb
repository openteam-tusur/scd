class ClaimsSearcher
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def results
    search.results
  end

  private

  def params_page
    params[:page] || 1
  end

  def params_query
    params[:q] || nil
  end

  def search
    Claim.search do
      keywords params_query

      order_by :created_at, :desc

      paginate :page => params_page, :per_page => Claim.per_page
    end
  end
end
