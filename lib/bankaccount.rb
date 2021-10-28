class BankAccount

  attr_reader :balance
  CURRENT_DATE = Time.now.strftime("%d/%m/%Y")

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    fail "Invalid deposit" if valid(amount)
    @balance += amount
    @transactions.unshift({ date: CURRENT_DATE, credit: amount, debit: nil, balance: @balance })
  end

  def withdrawal(amount)
    fail "Invalid withdrawal" if valid(amount)
    @balance -= amount
    @transactions.unshift({ date: CURRENT_DATE, credit: nil, debit: amount, balance: @balance })
  end

  def printstatement
    statement_header
    @transactions.each { |transaction|
      puts "#{transaction[:date]} || #{format(transaction[:credit])}|| #{format(transaction[:debit])}|| #{'%.2f' % transaction[:balance]}"
    }
  end

  private
  def valid(amount)
    amount == 0 || amount.class == String
  end

  def statement_header
    puts "date || credit || debit || balance"
  end

  def format(value)
    value.nil? ? '' : '%.2f' % value + ' '
  end
end