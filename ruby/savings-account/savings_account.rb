module SavingsAccount
  def self.interest_rate(balance)
    case
    when balance < 0.0                         then -3.213
    when balance < 1000.0                      then 0.5
    when balance >= 1000.0 && balance < 5000.0 then 1.621
    else 2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + balance.abs * interest_rate(balance) / 100.0
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    balance = current_balance
    while balance < desired_balance 
      balance = annual_balance_update balance 
      years += 1
    end
    years
  end
end
