require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  
  def initialize(send, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  # def execute_transaction
  # end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end

end
