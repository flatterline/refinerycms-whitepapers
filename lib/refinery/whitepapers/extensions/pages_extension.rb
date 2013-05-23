module Refinery
  module Whitepapers
    module Extensions
      module Pages
        def has_one_whitepaper_page
          has_one :whitepaper_page, as: :page, dependent: :destroy
          has_one :whitepaper, through: :whitepaper_page, source: :resource

          attr_accessible :whitepaper_page

          module_eval do
            def whitepaper_page=(whitepaper_page_params)
              # new
              self.build_whitepaper_page if self.whitepaper_page.nil?

              # destroy
              if whitepaper_page_params[:resource_id].blank?
                self.whitepaper_page.destroy

              # create or update if changed
              elsif self.whitepaper_page.resource_id.to_s != whitepaper_page_params[:resource_id]
                self.whitepaper_page.attributes = whitepaper_page_params
              end
            end
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::Whitepapers::Extensions::Pages)
