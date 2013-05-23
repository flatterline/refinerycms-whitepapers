module Refinery
  module Admin
    class WhitepapersController < ::Refinery::Admin::ResourcesController

      def new
        super
        @url_override = refinery.admin_whitepapers_path
      end

      def create
        @resources = Resource.create_resources(params[:resource])
        @resource = @resources.detect { |r| !r.valid? }

        if @resources.all?(&:valid?)
          flash.notice = t('created', scope: 'refinery.crudify', what: "'#{@resources.map(&:title).join("', '")}'")
          @dialog_successful = true

          render layout: false
        else
          self.new # important for dialogs
          render action: 'new'
        end
      end
    end
  end
end
