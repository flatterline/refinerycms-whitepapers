module Refinery
  module Whitepapers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Whitepapers
      engine_name :refinery_whitepapers

      def self.register(tab)
        tab.name = tab.name = ::I18n.t(:'refinery.plugins.refinerycms_whitepapers.tab_name')
        tab.partial = '/refinery/admin/pages/tabs/whitepaper'
      end

      initializer "register refinerycms_whitepapers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.activity = { class_name: 'Refinery::WhitepaperPage' }
          plugin.hide_from_menu = true
          plugin.menu_match =  %r{refinery/whitepapers(/.+?)?$}
          plugin.name = "refinerycms_whitepapers"
          plugin.pathname = root
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.admin_whitepapers_path }
        end
      end

      config.to_prepare do
        require 'refinerycms-pages'
        Refinery::Page.send :has_one_whitepaper_page
      end

      config.after_initialize do
        Refinery::Pages::Tab.register do |tab|
          register tab
        end

        Refinery.register_engine(Refinery::Whitepapers)
      end
    end
  end
end
