class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    fail "Invalid deposit" if amount == 0 || amount.class == String
    @balance += amount
  end

  def withdrawal(amount)
    fail "Invalid withdrawal" if amount == 0 || amount.class == String
    @balance -= amount
  end

  def printstatement
    "date || credit || debit || balance"
  end
end