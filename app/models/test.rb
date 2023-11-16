class Test < ApplicationRecord
   def self.tests_by_category(category_name)
    Test.joins(:category)
        .where(categories: { name: category_name })
        .order(title: :desc)
        .pluck(:title)
  end
end
