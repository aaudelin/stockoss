class Db::Order < ApplicationRecord
  has_many :line_items, class_name: "Db::LineItem"
end
