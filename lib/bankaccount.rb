class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    fail "Invalid deposit" if valid(amount)
    @balance += amount
  end

  def withdrawal(amount)
    fail "Invalid withdrawal" if valid(amount)
    @balance -= amount
  end

  def printstatement
    "date || credit || debit || balance"
  end

  private
  def valid(amount)
    amount == 0 || amount.class == String
  end
end