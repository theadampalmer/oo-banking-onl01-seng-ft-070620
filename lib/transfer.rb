require 'pry'

class Transfer
  
  def initialize(send, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  # def execute_transaction
  # end

  def reverse_transfer
    if @status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.desposit
      self.status = "reversed"
    end
  end

end
