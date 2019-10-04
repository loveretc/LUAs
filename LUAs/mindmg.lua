-- local variables for API functions. any changes to the line below will be lost on re-generation
local client_set_event_callback, ui_new_checkbox, ui_reference = client.set_event_callback, ui.new_checkbox, ui.reference

-------- Local --------

local ui_new_slider = ui.new_slider
local ui_new_hotkey = ui.new_hotkey
local ui_set = ui.set
local ui_get = ui.get
local c_draw = client.draw_indicator
local c_size = client.screen_size
local reduce = false

-------- Fix for auto and HP+i --------

local damagefix = {
	[0] = "Auto",
}

for i=1, 26 do
	damagefix[100 + i] = "HP + " .. i
end

-------- Menu draw --------
local hotkey = ui_new_checkbox('LUA', 'B', 'Minimum damage override')
local hotkey_hk = ui.new_hotkey('LUA', 'B', 'Minimum damage override hotkey', true)
local slider_dmg = ui_new_slider('LUA', 'B', 'Ammount', 0, 126, 0, true, "", 1, damagefix)
local min_dmg = ui_reference('RAGE', 'aimbot', 'minimum damage')

-------- Actual override --------{
local function reduction(c)
	local h_key = ui.get(hotkey_hk)
	local dmg_slider_ref = ui_get(slider_dmg)
	local sw, sh = c_size()
	local x = sw / 2
	local y = sh - 200

	if h_key and reduce == false then
		stored_dmg = ui_get(min_dmg)
		ui_set(min_dmg, dmg_slider_ref)
		reduce = true
	elseif not h_key and reduce == true then
		ui_set(min_dmg, stored_dmg)
		reduce = false
	end

	-------- Actual indicator --------

	local overriding = ui.get(hotkey)

	if reduce then
		c_draw(c, 124, 195, 21, 255, "DAMAGE")
	end

end

client_set_event_callback("paint", reduction)
