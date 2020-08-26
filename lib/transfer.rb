class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(account_one, account_two, amount)
    self.sender = account_one
    self.receiver = account_two
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && status == "pending" && self.sender.balance > self.amount
      if self.valid? && status == "pending"
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else

        self.status = "rejected"
        puts "Transaction rejected. Please check your account balance."

        raise Error "Somebody messed up here. One or more accounts are not valid."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      raise Error "The transaction cannot be reversed because it has not been executed."
    end
  end



end
