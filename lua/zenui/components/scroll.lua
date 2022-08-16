--[[
    ZenUI By ImWuX
    Components/Scroll
]]--

local SCROLL = {}

function SCROLL:Init()
    self:SetColor(ZenUI.Colors.Secondary)
    self:SetActiveColor(ZenUI.Colors.Accent)

    self.ScrollBar = self:GetVBar()
    self.ScrollBar:SetWide(10)
    self.ScrollBar:SetHideButtons(true)

    self.ScrollBar.Paint = function() end
    self.ScrollBar.btnUp.Paint = function() end
    self.ScrollBar.btnDown.Paint = function() end
    self.ScrollBar.btnGrip.Paint = function(_, w, h)
        local color = self.Color
        if self.ScrollBar.btnGrip:IsHovered() or self.ScrollBar.Dragging then
            color = self.ActiveColor
        end
        draw.RoundedBox(10, 2, 0, w - 4, h, color)
    end
end

function SCROLL:SetColor(color)
    self.Color = color
end

function SCROLL:GetColor()
    return self.Color
end

function SCROLL:SetActiveColor(color)
    self.ActiveColor = color
end

function SCROLL:GetActiveColor()
    return self.ActiveColor
end

vgui.Register("ZenUI.Scroll", SCROLL, "DScrollPanel")
