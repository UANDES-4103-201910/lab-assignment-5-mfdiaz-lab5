class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone
  has_many :tickets
end
