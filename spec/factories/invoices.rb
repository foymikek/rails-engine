FactoryBot.define do
  factory :invoice do
    status {['shipped','packaged','returned'].sample}
    merchant
    customer
  end
end