aoe = {}

local mod_path = minetest.get_modpath("aoe")
dofile(mod_path.."/config.lua")
dofile(mod_path.."/functions.lua")

--Move to it's own 
function aoe.get_formspec(name)
    -- TODO: display whether the last guess was higher or lower
    local text = "I'm thinking of a number... Make a guess!"

    local formspec = {
        "formspec_version[4]",
        "size[6,3.476]",
        "label[0.375,0.5;", minetest.formspec_escape(text), "]",
        "field[0.375,1.25;5.25,0.8;number;Number;]",
        "button[1.5,2.3;3,0.8;guess;Guess]"
    }

    -- table.concat is faster than string concatenation - `..`
    return table.concat(formspec, "")
end

function aoe.show_to(name)
    minetest.show_formspec(name, "aoe:game", aoe.get_formspec(name))
end

minetest.register_node("aoe:test",{
	description = "for testing schem placement",
	tiles = {"aoe_test.png"},
	groups = {cracky = 1},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		--minetest.chat_send_all(pos.z)
		aoe.show_to(clicker:get_player_name())
		minetest.place_schematic(pos, minetest.get_modpath("aoe").."/schematics/test.mts", 0, nil, false)
	end,
})

minetest.register_node("aoe:placementIndicator",{
    description = "Used to indicate the placement of schematic",
    tiles = {"aoe_pi.png^[opacity:200"},
    drawtype = "glasslike",
    groups = {walkable = 0, 
            --not_in_creative_inventory = 1, 
            buildable_to = 1,
            diggable = 0},

})

minetest.register_node("aoe:padplacer",{
    description = "placed pad based on sertain criteria",
    tiles = {"aoe_pi.png"},
    groups = {walkable = 0, 
            --not_in_creative_inventory = 1, 
            buildable_to = 1,
            cracky = 1,
            diggable = 1},
    on_construct = function(pos)
        aoe.placePad(10,10,pos)
    end,

})
