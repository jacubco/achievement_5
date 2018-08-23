FactoryBot.define do
# Inside the block we define all factories for this file

  factory :product, class: Product do
    name "nice bike"
  end


  factory :comment do
    rating {5}
    body {"Great bike!"}
    user
  end
end
