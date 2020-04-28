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
    if @amount > 0 && @status == "pending" && sender.valid? && receiver.valid?
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      @amount = amount - amount
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end




end
