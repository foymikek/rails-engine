class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  
  belongs_to :merchant
  
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  class << self
    def by_revenue(quantity)
      joins(:transactions)
      .select('items.*,sum(invoice_items.unit_price * invoice_items.quantity) as revenue')
      .where('transactions.result = ?', "success")
      .group(:id)
      .order(revenue: :desc)
      .limit(quantity)
    end
  end
end