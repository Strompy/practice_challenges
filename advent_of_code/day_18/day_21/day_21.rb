foods = File.read('input.txt').lines.map do |s|
  s =~ /(.*) \(contains (.*)\)/
  [ $1.split, $2.split(', ') ]
end
ingredients = foods.map(&:first).flatten.uniq.sort
allergens = foods.map(&:last).flatten.uniq.sort

invalid = ingredients.select do |ingredient|
  potential = foods.select do |ingredients, allergens|
    ingredients.include?(ingredient)
  end.map(&:last).flatten.uniq
  potential.none? do |allergen|
    foods.all? do |ingredients, allergens|
      allergens.include?(allergen) || ingredients.include?(ingredient)
    end
  end
end

invalid = ingredients.select do |ings|
  potential = foods.select do|ingredients, allergens|
     ingredients.include?(ings)
   end.map(&:last).flatten.uniq

  potential.none? do |allergen|
    foods.all? do|ingredients, allergens|
      !allergens.include?(allergen) || ingredients.include?(ings)
     end
  end
end

count = foods.map(&:first).flatten.count do |ingredient|
  invalid.include?(ingredient)
end

puts "Part 1: #{count}"
