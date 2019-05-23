# hypr9boost
Boost for vehicles, purchasable and usable by everyone.
This only works with ESX.

Run the following query to add nitro or add it yourself.
```
INSERT INTO `items` (name, label) VALUES 
	('nitro', 'Nitroso');
```

If you want to change values of how much the turbo should do change the following in client.lua
Line 37, change 80.0 to whatever you want.

If you don't want to keep the 3 second delay just comment the line 42.

How to install:

Clone this repo into your resources folder.
Add "start hypr9boost" to your server.cfg, no commas.

How to use:

F2 > Inventory > Nitro > Use
Press E when in a car to use.
