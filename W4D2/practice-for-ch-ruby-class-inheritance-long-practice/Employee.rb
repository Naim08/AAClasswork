class Employee

  def initialize(name, title, salary, boss)
     @name = name
     @title = title
     @salary = salary
     @boss = boss
  end

  def name
    @name
  end

  def title
    @title
  end

  def bonus(multiplier)
    multiplier * @salary
  end

  protected
  attr_reader :salary

  def boss
    @boss
  end

end

class Manager < Employee
  attr_reader :subordinates
  def initialize (name, title, salary, boss)
    super
  @subordinates = []
  end

def add_subordinates(subordinate)
  return nil if self.subordinates.include?(subordinate)
  self.subordinates << subordinate
end

def inspect
  "{@name}"
end

def bonus(multiplier)
  self.subordinate_salary.sum * multiplier
end


def subordinate_salary
  return [self.salary] if !self.is_a?(Manager)

  results = []
  self.subordinates.each do |subordinate|
    p subordinate
    results += [subordinate.salary]
  if subordinate.is_a?(Manager)
    results += subordinate.subordinate_salary
  end
end
results

end

end
John = Manager.new('John', 'VC', 150000, nil)
Ned = Manager.new('Ned', 'Founder', 1000000, John)
Darren = Manager.new('Darren', 'Manager', 78000, Ned)
Shawna = Employee.new('Shawna', 'TA', 12000, Darren)
David = Employee.new('David', 'TA', 10000, Darren)




p David.bonus(3)
Darren.add_subordinates(Shawna)
Darren.add_subordinates(David)
Ned.add_subordinates(Darren)
John.add_subordinates(Ned)
# p Ned.bonus(5)
# p John.bonus(5)
p John.bonus(5)
p Ned.bonus(5)
