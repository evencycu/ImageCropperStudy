class Event < ActiveRecord::Base
   validates_presence_of :name
   has_one :location
end
