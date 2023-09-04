# This is a job for the Sandy Bar MLO
> (https://www.gta5-mods.com/maps/biker-bar-sandy-shores-ymap)

## Insert into @qb-core/shared/jobs.lua 
```
QBShared.Jobs = {
    ["sandybar"] = {
		label = "Sandy\'s Bar",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 75 --edit depending on your economy
            },
		       	['1'] = {
                name = "Worker",
                payment = 100 --edit depending on your economy
            },
            ['3'] = {
                name = "manager",
                payment = 150 --edit depending on your economy
            },
		       	['4'] = {
                name = "Owner",
                isboss = true,
                payment = 200 --edit depending on your economy
           },
       },
	 },
}		
```

## Insert into @qb-core/shared/items.lua 
```
	--Drink Ingredients
	["cubasil"] 					= {["name"] = "cubasil",  	     			["label"] = "Cucumber Basil",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cubasil.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Hand full of Cucumber and Basil", ['hunger'] = math.random(40, 50) },
	["mintleaf"] 					= {["name"] = "mintleaf",  	     		    ["label"] = "Mint",	 			 		["weight"] = 200, 		["type"] = "item", 		["image"] = "mint.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Mint Leaves", ['hunger'] = math.random(40, 50) },
	["peach"] 						= {["name"] = "peach",  	     			["label"] = "Peach",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "peach.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A peach", ['hunger'] = math.random(40, 50) },
	["strawberry"] 					= {["name"] = "strawberry",  	     		["label"] = "Strawberries",	 	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "strawberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Strawberries", ['hunger'] = math.random(40, 50) },
	["orange"] 				 		= {["name"] = "orange",  	     			["label"] = "Orange",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "orange.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "An Orange." },
	["lime"] 				 		= {["name"] = "lime",  	     				["label"] = "Lime",	 			 		["weight"] = 200, 		["type"] = "item", 		["image"] = "lime.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Lime." },
	["lemon"] 				 		= {["name"] = "lemon",  	     			["label"] = "Lemon",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "lemon.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Lemon." },
	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Chocolate Bar", ['hunger'] = math.random(20, 30) },
	["midori"] 						= {["name"] = "midori",  	     			["label"] = "Midori",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "midori.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Midori", ['thirst'] = math.random(40, 50) },
	["pinejuice"] 					= {["name"] = "pinejuice",  	     		["label"] = "Pineapple Juice",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "pinejuice.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Pineapple Juice", ['thirst'] = math.random(40, 50) },
	["prosecco"] 					= {["name"] = "prosecco",  	     			["label"] = "Prosecco",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "prosecco.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Prosecco", ['thirst'] = math.random(40, 50) },
	["tequila"] 					= {["name"] = "tequila",  	     			["label"] = "Tequila",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "tequila.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Tequila", ['thirst'] = math.random(40, 50) },
	["triplsec"] 					= {["name"] = "triplsec",  	     			["label"] = "Triple Sec",	 	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "triplesec.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true, ["combinable"] = nil,   ["description"] = "Triple Sec", ['thirst'] = math.random(40, 50) },
	["cranberry"] 				 	= {["name"] = "cranberry",  	     		["label"] = "Cranberry Juice",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cranberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cranberry Juice", ['thirst'] = math.random(20, 30) },
	["gin"] 					 	= {["name"] = "gin",  	     				["label"] = "Gin",	 			 		["weight"] = 200, 		["type"] = "item", 		["image"] = "gin.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Gin", ['thirst'] = math.random(20, 30) },
	["rum"] 					 	= {["name"] = "rum",  	     				["label"] = "Rum",	 			 		["weight"] = 200, 		["type"] = "item", 		["image"] = "rum.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Rum", ['thirst'] = math.random(20, 30) },
	["amaretto"] 					= {["name"] = "amaretto",  	     			["label"] = "Amaretto",	 		 		["weight"] = 200, 		["type"] = "item", 		["image"] = "amaretto.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Amaretto", ['thirst'] = math.random(20, 30) },
	--Cocktails
	["amarettosour"] 				= {["name"] = "amarettosour",  	     		["label"] = "Amaretto Sour",	     		["weight"] = 200, 		["type"] = "item", 		["image"] = "amarettosour.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Amaretto Sour", ['thirst'] = math.random(40, 50) },
	["bellini"] 					= {["name"] = "bellini",  	     			["label"] = "Bellini",	 		     		["weight"] = 200, 		["type"] = "item", 		["image"] = "bellini.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Bellini", ['thirst'] = math.random(40, 50) },
	["cosmopolitan"] 				= {["name"] = "cosmopolitan",  	     		["label"] = "Cosmopolitan",	 		 	["weight"] = 200, 		["type"] = "item", 		["image"] = "cosmopolitan.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cosmopolitan", ['thirst'] = math.random(40, 50) },
	["longisland"] 					= {["name"] = "longisland",  	     		["label"] = "Long Island Ice tea",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "longisland.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Long Island Ice Tea", ['thirst'] = math.random(40, 50) },
	["margarita"] 					= {["name"] = "margarita",  	     		["label"] = "Margarita",	 		 	["weight"] = 200, 		["type"] = "item", 		["image"] = "margarita.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Margarita", ['thirst'] = math.random(40, 50) },
	["pinacolada"] 					= {["name"] = "pinacolada",  	     		["label"] = "Pina Colada",	 		 	["weight"] = 200, 		["type"] = "item", 		["image"] = "pinacolada.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Pine Colada", ['thirst'] = math.random(40, 50) },
	["sangria"] 					= {["name"] = "sangria",  	     			["label"] = "Sangria",	 			 	["weight"] = 200, 		["type"] = "item", 		["image"] = "sangria.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Sangria", ['thirst'] = math.random(40, 50) },
	["screwdriver"] 				= {["name"] = "screwdriver",  	     		["label"] = "Screwdriver",	 		 	["weight"] = 200, 		["type"] = "item", 		["image"] = "screwdriver.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Screwdriver", ['thirst'] = math.random(40, 50) },
	["strawdaquiri"] 				= {["name"] = "strawdaquiri",  	     		["label"] = "Strawberry Daquiri",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "strawdaquiri.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Strawberry Daquiri", ['thirst'] = math.random(40, 50) },
	["strawmargarita"] 				= {["name"] = "strawmargarita",  	     	["label"] = "Strawberry Margarita",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "strawmargarita.png",["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Starberry Margarita", ['thirst'] = math.random(40, 50) },
	--BEERS
	["ambeer"] 						= {["name"] = "ambeer",  	    	 		["label"] = "AM Beer",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ambeer.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["dusche"] 						= {["name"] = "dusche",  	    	 		["label"] = "Dusche Gold",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "dusche.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["logger"] 						= {["name"] = "logger",  	    	 		["label"] = "Logger Beer",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "logger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser"] 					= {["name"] = "pisswasser",  	    	 	["label"] = "Pißwasser",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser1.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser2"] 				= {["name"] = "pisswasser2",  	    	 	["label"] = "Pißwasser Stout",			["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser2.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser3"] 				= {["name"] = "pisswasser3",  	    	 	["label"] = "Pißwasser Pale Ale",		["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser3.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	--SODA
	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	--Food
	["nplate"] 						= {["name"] = "nplate",  	     			["label"] = "Nachos Plate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "nplate.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A plate of nachos and cheese", ['hunger'] = math.random(40, 50) },
	["vusliders"] 				 	= {["name"] = "vusliders",  	     		["label"] = "Sliders",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sliders.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Sliders", ['hunger'] = math.random(40, 50) },
	["vutacos"] 				 	= {["name"] = "vutacos",  	     			["label"] = "Tacos",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tacos.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Tacos", ['hunger'] = math.random(40, 50) },
	["tots"] 				 		= {["name"] = "tots",  	     				["label"] = "Tits or Tots",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "tots.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Sexy Tots", ['hunger'] = math.random(40, 50) },	
	--Food Ingredients
	["meat"] 						= {["name"] = "meat",  	     				["label"] = "Meat",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "meat.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A slab of Meat", ['hunger'] = math.random(40, 50) },
	["nachos"] 						= {["name"] = "nachos",  	     			["label"] = "Nachos",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "nachos.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bag of Nachos", ['hunger'] = math.random(40, 50) },
	["lettuce"] 	 			 	= {["name"] = "lettuce",       				["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["cheddar"] 					= {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Food" },
	["potato"] 						= {["name"] = "potato",						["label"] = "Potatoes",					["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Food" },

```

Made By GhostmaneX#2077 W ❤️
