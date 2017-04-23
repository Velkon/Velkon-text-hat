vTextHat = vTextHat or {}

-- The command said in chat that a player can use to customize his text hat.
-- (If the hat he has can be customizable)
vTextHat.Command = "!texthat"

-- The message said in chat when the player is allowed to customize the hat he has on him.
-- When he wears it.
vTextHat.FirstMsg = "You are wearing a text hat! You can type !texthat to customize it!"

-- If true, it will only display the above text message once (Until he has opened the menu first)
vTextHat.OnlyDisplayOnce = true

-- The distance at which text hats dissapear
-- (If your map is really big and unoptimized or something)
vTextHat.Distance = 5000
