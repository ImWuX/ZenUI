--[[
    ZenUI By ImWuX
    Components/Label
]]--

ZenUI.Utils.CreateFont("ZenUI.Label.Text", 20)

local LABEL = {}

function LABEL:Init()
    self.Font = "ZenUI.Label.Text"
    self:SetText("ZenUI Label")
    self:SetTextColor(ZenUI.Colors.Text)
end

function LABEL:Paint(w, h)
    surface.SetFont(self.Font)
    surface.SetTextColor(self.Color)
    surface.SetTextPos(0, 0)
    surface.DrawText(self.Text)
end

function LABEL:SetText(text)
    self.Text = text
end

function LABEL:GetText()
    return self.Text
end

function LABEL:SetTextColor(color)
    self.Color = color
end

function LABEL:GetTextColor()
    return self.Color
end

function LABEL:SetFontSize(size)
    self.Font = "ZenUI.Label.Text" .. size
    ZenUI.Utils.CreateFont(self.Font, size)
end

vgui.Register("ZenUI.Label", LABEL)