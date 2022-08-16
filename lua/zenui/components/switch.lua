--[[
    ZenUI By ImWuX
    Components/Switch
]]--

local SWITCH = {}

function SWITCH:Init()
    self.VisualWidth = 40
    self:SetSize(self.VisualWidth, 20)
    self:SetText("")
    self:SetOnColor(ZenUI.Colors.Accent)
    self:SetOffColor(ZenUI.Colors.Secondary)

    self.Value = false
end

function SWITCH:PerformLayout(w, h)
    self:ReCalculateCircle()
end

function SWITCH:ReCalculateCircle()
    self.CircleData = ZenUI.Utils.CalculateCircle(self.Value and self.VisualWidth - self:GetTall() or 0, 0, self:GetTall(), self:GetTall())
end

function SWITCH:Paint(w, h)
    draw.RoundedBox(20, 5, 5, self.VisualWidth - 10, h - 10, self.Value and self.OnColor or self.OffColor)
    surface.SetDrawColor(ZenUI.Utils.Differ(self.Value and self.OnColor or self.OffColor, 12))
    draw.NoTexture()
    surface.DrawPoly(self.CircleData)
end

function SWITCH:DoClick()
    self.Value = !self.Value
    self:ReCalculateCircle()
end

function SWITCH:SetValue(value)
    self.Value = value
end

function SWITCH:GetValue()
    return self.Value
end

function SWITCH:SetOnColor(color)
    self.OnColor = color
end

function SWITCH:GetOnColor()
    return self.OnColor
end

function SWITCH:SetOffColor(color)
    self.OffColor = color
end

function SWITCH:GetOffColor()
    return self.OffColor
end

vgui.Register("ZenUI.Switch", SWITCH, "DButton")