class Invoice < ApplicationRecord
  validates_presence_of :status
  
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions, dependent: :destroy
  has_many :invoice_items 
  has_many :items, through: :invoice_items



  def self.unshipped_revenue(quantity)
    select('invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) as potential_revenue')
    .joins(:invoice_items)
    .where(status: :packaged)
    .group(:id)
    .order(potential_revenue: :desc)
    .limit(quantity)
  end
end