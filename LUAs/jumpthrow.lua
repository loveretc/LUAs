-- local variables for API functions. any changes to the line below will be lost on re-generation
local client_set_event_callback, entity_get_classname, entity_get_local_player, entity_get_player_weapon, entity_get_prop, ui_get, ui_new_checkbox, ui_new_hotkey = client.set_event_callback, entity.get_classname, entity.get_local_player, entity.get_player_weapon, entity.get_prop, ui.get, ui.new_checkbox, ui.new_hotkey

-------- Local --------
local throw = ui_new_checkbox ("MISC", "Settings", "Jumpthrow")
local throw = ui_new_hotkey("MISC", "Settings", "Jumpthrow", true)


-------- Code --------
client_set_event_callback("setup_command", function(c)
if ui_get(throw) then
	local weapon = entity_get_player_weapon(entity_get_local_player())
	if entity_get_classname(weapon) == "CSmokeGrenade" or "FlashBang" and entity_get_prop(weapon, "m_bPinPulled") == 1 then
		c.in_jump = 1
		c.in_attack = 0

	end
end
end)
