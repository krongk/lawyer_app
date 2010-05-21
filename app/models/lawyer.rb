class Lawyer < ActiveRecord::Base
  validates_presence_of :lawyer_name
end
