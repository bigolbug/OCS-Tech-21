function aoe.placePad(x,z,pos)
    -- The pad is placed baced on the pos and +x and +z direction
    -- Check to make sure that the pad is being placed within range of the ground. 
    -- Make this perportional to the dimensions of the pad. 
    -- TODO: improve on this, test to see if z or x is bigger. 
    local depth = pos.z - math.floor(x*(.8))

    for i = 1, x, 1 do
        for j = 1, z, 1 do
            local node = minetest.get_node({x=x,y=depth,z=z})
            minetest.chat_send_all(node.get_name())
        end 
    end

end