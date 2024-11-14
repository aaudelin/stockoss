class Db::LineItem < ApplicationRecord
  belongs_to :order, class_name: "Db::Order"
end
