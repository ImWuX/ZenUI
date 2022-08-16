--[[
    ZenUI By ImWuX
    Components/Button
]]--

ZenUI.Utils.CreateFont("ZenUI.Button.Text", 20)

local BUTTON = {}

function BUTTON:Init()
    self:SetText("ZenUI Button")
    self:SetColor(ZenUI.Colors.Secondary)
    self:SetTextColor(ZenUI.Colors.Text)
    self:SetFont("ZenUI.Button.Text")
    self:SetTall(30)
end

function BUTTON:Paint(w, h)
    local color = self:GetColor()
    if self:IsHovered() then
        color = ZenUI.Utils.Differ(color, 5)
    end

    draw.RoundedBox(4, 1, 1, w - 2, h - 2, color)
end

function BUTTON:SetColor(color)
    self.Color = color
end

function BUTTON:GetColor()
    return self.Color
end

function BUTTON:SetFontSize(size)
    self.Font = "ZenUI.Button.Text" .. size
    ZenUI.Utils.CreateFont(self.Font, size)
    self:SetFont(self.Font)
end

vgui.Register("ZenUI.Button", BUTTON, "DButton")