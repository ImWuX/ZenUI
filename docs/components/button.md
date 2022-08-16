# Button (ZenUI.Button)
Derives from [DButton](https://wiki.facepunch.com/gmod/DButton).

## Methods
`void Button:SetColor( Color color )`  
Sets the background color of the button.

`Color Button:GetColor()`  
Returns the background color of the button.

`void Button:SetFontSize( number size )`  
Sets the font size of the button.

## Example
```lua
local button = vgui.Create("ZenUI.Button")
button:SetText("Sample Button")
button:Dock(TOP)
function button:DoClick()
    print("Clicked)
end
```
[Back](../main.md)