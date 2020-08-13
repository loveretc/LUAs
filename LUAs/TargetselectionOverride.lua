local change = false
local ref_selection = ui.reference('RAGE', 'Aimbot', 'Target selection')
local override_options = ui.new_combobox('LUA', 'A', 'Override target selection', 'Cycle', 'Cycle (2x)', 'Near crosshair', 'Highest damage', 'Lowest ping', 'Best K/D ratio', 'Best hit chance')
local override_hotkey = ui.new_hotkey('LUA', 'A', '\nOverride target selection', true)

local function changed(c)

    local h_key = ui.get(override_hotkey)
    local options_ref = ui.get(override_options)

    if h_key and change == false then
        stored_option = ui.get(ref_selection)
        ui.set(ref_selection, options_ref)
        change = true

    elseif not h_key and change == true then
        ui.set(ref_selection, stored_option)
        change = false
    end

    -- Very getto fix for indicator
    if h_key then
        renderer.indicator(255, 200, 0, 255, "OVERRIDE")
    end
end

client.set_event_callback("paint", changed)