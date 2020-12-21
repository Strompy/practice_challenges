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

inert = ingredients.select do |ings|
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
  inert.include?(ingredient)
end

puts "Part 1: #{count}"

not_safe_foods = foods.map do |ingredients, allergens|
  [ingredients - inert, allergens]
end
not_safe_ingredients = not_safe_foods.map(&:first).flatten.uniq

contains = foods.flat_map do |ingredients, allergens|
  allergens.map { |a| [a, ingredients] }
end


unsafe_foods = foods.map { |ings, allergs| [ ings - inert, allergs ] }
ingredients = unsafe_foods.map(&:first).flatten.uniq.sort
rules = unsafe_foods.flat_map { |ings, allergs| allergs.map { |a| [ a, ings ] } }.sort

ingredients.permutation(allergens.length).each do |permutation|
  hash = allergens.zip(permutation).to_h
  if rules.all? { |aller, ings| ings.include?(hash[aller]) }
    p hash.values.join(',')
    break
  end
end
