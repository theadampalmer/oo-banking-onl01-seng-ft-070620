require 'pry'

class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
    
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    end
  end

end
