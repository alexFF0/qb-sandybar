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

Made By GhostmaneX#2077 W ❤️
