require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    
    if @sender.status == "open" && @sender.balance > @amount && @status == "pending" && @receiver.status == "open"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end

  def reverse_transfer
    if @sender.status == "open" && @receiver.balance > @amount && @status == "complete" && @receiver.status == "open"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end

  end


  # your code here
end
