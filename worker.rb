class Worker
	attr_writer :name, :salary

	def initialize(name, salary)
    raise 'Не введен размер зарплаты' if salary == ''
		@name, @salary = name, salary.to_i
	end

  def prize
    @salary * 0.1
  end

  def sum
    @salary + prize
  end

  def to_s
    'Сотрудник ' + @name + ' в этом месяце получит ' + sum.to_s + ' рублей!'
  end

  def to_ary
    [@name, @salary]
  end

end