class BankAccount
  
  def initialize(name)
    @name = name
    @balance = balance
    @status = status
  end
  
  def deposit(deposit)
    self.balance += deposit
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    self.balance > 0 && status == "open"
  end
    
  def close_account
    @status = "closed"
  end
  
end