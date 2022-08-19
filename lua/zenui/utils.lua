--[[
    ZenUI By ImWuX
    Utils
]]--

ZenUI.Utils = ZenUI.Utils or {}

function ZenUI.Utils.CreateFont(name, size)
    surface.CreateFont(name, {
        font = "Montserrat Medium",
        size = size,
        weight = 500
    })
end

function ZenUI.Utils.Darken(color, amount)
    return Color(math.max(color.r - amount, 0), math.max(color.g - amount, 0), math.max(color.b - amount, 0))
end

function ZenUI.Utils.Lighten(color, amount)
    return Color(math.min(color.r + amount, 255), math.min(color.g + amount, 255), math.min(color.b + amount, 255))
end

function ZenUI.Utils.Differ(color, amount)
    if color.r < 100 and color.g < 100 and color.b < 100 then
        return ZenUI.Utils.Lighten(color, amount)
    else
        return ZenUI.Utils.Darken(color, amount)
    end
end

function ZenUI.Utils.CalculateCircle(x, y, w, h, vertices)
    vertices = vertices or 50
    local poly = {}

    local x = w / 2 + x
    local y = h / 2 + y
    local radius = h / 2

    table.insert(poly, { x = x, y = y })

    for i = 0, vertices do
        local a = math.rad((i / vertices) * -360)
        table.insert(poly, { x = x + math.sin(a) * radius, y = y + math.cos(a) * radius })
    end

    local a = math.rad(0)
    table.insert(poly, { x = x + math.sin(a) * radius, y = y + math.cos(a) * radius })
    return poly
end

/*
    Credits to TDLib for the DrawCircle & DrawArc 
*/
ZenUI.Utils.DrawCircle = function(x, y, radius, color)
    local circle = {}

    for i = 1, 360 do
        circle[i] = {}
        circle[i].x = x + math.cos(math.rad(i * 360) / 360) * radius
        circle[i].y = y + math.sin(math.rad(i * 360) / 360) * radius
    end

    surface.SetDrawColor(color)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

ZenUI.Utils.DrawArc = function(x, y, ang, p, rad, color, seg)
    seg = seg || 80
    ang = (-ang) + 180
    local circle = {}

    table.insert(circle, {x = x, y = y})
    for i = 0, seg do
        local a = math.rad((i / seg) * -p + ang)
        table.insert(circle, {x = x + math.sin(a) * rad, y = y + math.cos(a) * rad})
    end

    surface.SetDrawColor(color)
    draw.NoTexture()
    surface.DrawPoly(circle)
end