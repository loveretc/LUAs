-- LOCAL 
local throw = ui.new_checkbox ("MISC", "Settings", "Jumpthrow")
local throw = ui.new_hotkey("MISC", "Settings", "Jumpthrow", true)


-- Code
client.set_event_callback("setup_command", function(c)
    if ui.get(throw) then
        local weapon = entity.get_player_weapon(entity.get_local_player())
        if entity.get_classname(weapon) == "CSmokeGrenade" or "FlashBang" and entity.get_prop(weapon, "m_bPinPulled") == 1 then
            c.in_jump = 1
            c.in_attack = 0

        end
    end
end)