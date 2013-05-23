module Refinery
  class WhitepaperPage < Refinery::Core::BaseModel
    belongs_to :page,      polymorphic: true
    belongs_to :resource , class_name: Refinery::Resource

    attr_accessible :page, :page_id, :resource_id, :page_type
  end
end
