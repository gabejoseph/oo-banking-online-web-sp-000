require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end 

  def execute_transaction 
    binding.pry
    if @status == "pending" && sender.balance - amount > 0
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end




end
