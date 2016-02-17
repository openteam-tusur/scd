class PermissionsSearcher
  attr_accessor :user, :params, :role

  def initialize(user, params, role = nil)
    @user = user
    @params = params
    @role = role
  end

  def results
    search.results
  end

  private

  def params_role
    params[:for_role] || nil
  end

  def params_page
    params[:page]
  end

  def params_query
    params[:q] || nil
  end

  def search
    Permission.search do
      keywords params_query

      order_by :user_fullname, :asc

      paginate :page => params_page, :per_page => Permission.per_page

      with :role, params_role if params_role

      case role
      when :onir_manager
        any_of do
          with :role, 'entrant_manager'
          with :role, 'faculty_manager'
        end
      when :faculty_manager
        with :role, 'entrant_manager'
        with :context_ids, user.permission_faculty.id
        with :context_type, 'Faculty'
      end
    end
  end
end
