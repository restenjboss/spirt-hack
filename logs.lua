local font = Render.InitFont("Verdana", 12)
local hitlogs = {}


Cheat.RegisterCallback("events", function(event)
    if event:GetName() ~= "player_hurt" then return end
    local me = EntityList.GetLocalPlayer()
    local attacker = EntityList.GetPlayerForUserID(event:GetInt("attacker"))
    if attacker ~= me then return end
    local name = EntityList.GetPlayerForUserID(event:GetInt("userid", 0)):GetName()
    local damage = event:GetInt("dmg_health", 0)
    text = string.format("Hit %s for %s", name, damage)
    print(text)
    table.insert(hitlogs, {text = text, time = GlobalVars.realtime})
end)

Cheat.RegisterCallback("draw", function()
    local x, y = 5, 5
    for i, hitlog in ipairs(hitlogs) do
        Render.Text(hitlog.text, Vector2.new(x, y), Color.new(1, 1, 1), 12, font)
        y = y + 15
        if hitlog.time + 5 < GlobalVars.realtime then table.remove(hitlogs, i) end
    end
end)
