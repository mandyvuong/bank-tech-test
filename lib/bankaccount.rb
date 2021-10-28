class BankAccount

  attr_reader :balance

  CURRENT_DATE = Time.now.strftime('%d/%m/%Y')

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'Invalid deposit' if valid(amount)

    @balance += amount
    @transactions.unshift({ date: CURRENT_DATE, credit: amount, debit: nil, balance: @balance })
  end

  def withdrawal(amount)
    raise 'Invalid withdrawal' if valid(amount)

    @balance -= amount
    @transactions.unshift({ date: CURRENT_DATE, credit: nil, debit: amount, balance: @balance })
  end

  def printstatement
    statement_header
    statement_body(@transactions)
  end

  private
  
  def valid(amount)
    amount == 0 || amount.instance_of?(String)
  end

  def statement_header
    puts 'date || credit || debit || balance'
  end

  def statement_body(body)
    body.each do |row|
      puts "#{row[:date]} || #{formatting(row[:credit])}|| #{formatting(row[:debit])}|| #{format_balance(row[:balance])}"
    end
  end

  def formatting(value)
    value.nil? ? '' : format('%.2f', value) + ' '
  end

  def format_balance(value)
    format('%.2f', value)
  end
end