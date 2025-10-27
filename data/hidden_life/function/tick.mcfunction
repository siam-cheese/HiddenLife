execute as @a[tag=!hl] run scoreboard players set @s HLives 3
execute as @a[tag=!hl] run tag @s add hl

execute as @a[scores={HLives=-2}] at @s run function hidden_life:returntodeath
execute as @a[scores={HLives=-2}] at @s run scoreboard players set @s HLives -5

scoreboard players enable @a lifeCount

execute as @a[scores={lifeCount=1..}] run function hidden_life:get_life_count


scoreboard players set @a lifeCount 0

execute as @a[scores={HLives=0}] at @s run function hidden_life:returntodeath
execute as @a[scores={HLives=0}] at @s run forceload remove ~ ~

execute as @a[scores={deathTrigger=1..}] run scoreboard players operation @s HLives -= #1 numbers
execute as @a[scores={deathTrigger=1..}] at @a run playsound block.end_gateway.spawn ambient @s ~ ~ ~ .5 1
execute as @a[scores={deathTrigger=1..}] at @a run playsound block.bell.use ambient @s ~ ~ ~ .5 1

scoreboard players reset @a deathTrigger

execute as @a[scores={startRoll=0..}] run scoreboard players operation @s startRoll -= #1 numbers
execute as @a[scores={startRoll=0..}] run scoreboard players operation @s reRoll = @s startRoll
execute as @a[scores={startRoll=0..}] run scoreboard players operation @s reRoll %= spinRate numbers

execute as @a[scores={reRoll=0,startRoll=1..}] at @s run function hidden_life:show_lives

execute as @a[scores={startRoll=0}] at @s run playsound block.end_portal.spawn master @s ~ ~ ~
execute as @a[scores={startRoll=-1}] run scoreboard players set @s reRoll -1

execute as @a if score @s startRoll matches 250 run scoreboard players set spinRate numbers 3
execute as @a if score @s startRoll matches 200 run scoreboard players set spinRate numbers 5
execute as @a if score @s startRoll matches 100 run scoreboard players set spinRate numbers 7
execute as @a if score @s startRoll matches 20 run scoreboard players set spinRate numbers 10





