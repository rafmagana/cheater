**Method Chaining**
	Use it for stateless object construction
	Use it when the order of methods doesn't matter!!
	User it when you don't need to have a explicit terminator of the chain.
	Use nested methods to control completion
		
	class Ingredient
	  attr_accessor :quantity, :name

	  def initialize(ingredient)
	    @name = ingredient
	  end

	end

	class Numeric
	  def gram
	    self
	  end
	  alias_method :grams, :gram

	  def of(ingredient_name)
	    ingredient = Ingredient.new(ingredient_name)
	    ingredient.quantity = self
	    ingredient
	  end

	  def egg
	    self.of("egg")
	  end
	  alias_method :eggs, :egg

	  def unit

	  end
	  alias_method :units, :unit
	end

	class Recipe
	  attr_accessor :ingredients
	  def initialize
	    @ingredients = []
	  end

	  def add_ingredients(&block)
	    instance_eval(&block)
	  end

	  def add(ingredient)
	    @ingredients << ingredient
	  end
	end

	recipe = Recipe.new

	recipe.add_ingredients do
	  add 7.grams.of :sugar
	  add 0_5.grams.of :salt
	end
	
