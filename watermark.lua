widget_font_size = 12
widget_font  = Render.InitFont("Verdana", widget_font_size, {"r"})
screen_size = EngineClient.GetScreenSize()

local watermark_elements = {
    function()
        return " solus.io [beta]"
    end, Cheat.GetCheatUserName,
}

local draw_watermark = function()
    local elements = {}
    for i = 1, #watermark_elements do
        local result = watermark_elements[i]()
        if result then
            elements[#elements+1] = result
        end
    end

    local text = table.concat(elements, " | ")
    local w = Render.CalcTextSize(text, 12, widget_font).x + 10
    local x = screen_size.x - w - 10

    Render.Box(Vector2.new(x - 0.7, 8 - 0.5), Vector2.new(x + w + 0.7, 8 + 17), Color.new(255,255,255,133), 5)
    Render.BoxFilled(Vector2.new(x, 8), Vector2.new(x + w, 8 + 18), Color.RGBA(17, 17, 17,255), 5)
    Render.Text(text, Vector2.new(x + 2, 10 + 1), Color.new(255, 255, 255, 255), widget_font_size, widget_font);
end

Cheat.RegisterCallback("draw", function()
    draw_watermark()
end)
