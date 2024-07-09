-- Immersive Modern Warfare Footsteps + cloth + gear accents
-- Made by URAKOLOUY5
-- Sounds extracted by using Greyhound and Parasyte by "Scob Crew"
-- Edit by Lg

MFW = {}
MFW.Footsteps = {
    ["physics/cardboard/cardboard_box_impact_soft"] = "rubber",
    ["physics/plaster/ceiling_tile_step"] = "ceiling",
    ["player/footsteps/chainlink"] = "metal_grate",
    ["player/footsteps/concrete"] = "concrete",
    ["player/footsteps/dirt"] = "dirt",
    ["physics/plaster/drywall_footstep"] = "drywall",
    ["physics/glass/glass_sheet_step"] = "glass",
    ["player/footsteps/grass"] = "grass",
    ["player/footsteps/gravel"] = "gravel",
    ["player/footsteps/metal"] = "metal",
    ["physics/metal/metal_box_footstep"] = "metal_box",
    ["player/footsteps/metalgrate"] = "metal_grate",
    ["player/footsteps/mud"] = "mud",
    ["physics/plastic/plastic_barrel_impact_soft"] = "plastic",
    ["physics/plastic/plastic_box_impact_soft"] = "plastic",
    ["player/footsteps/rubber"] = "rubber",
    ["player/footsteps/sand"] = "sand",
    ["player/footsteps/snow"] = "snow",
    ["player/footsteps/tile"] = "tile",
    ["player/footsteps/duct"] = "vent",
    ["player/footsteps/slosh"] = "water",
    ["player/footsteps/wood"] = "wood",
    ["physics/wood/wood_box_footstep"] = "wood",
    ["player/footsteps/woodpanel"] = "wood_panel"
}

if CLIENT then
    local types = {
        "ceiling",
        "chainlink",
        "concrete",
        "dirt",
        "drywall",
        "glass",
        "grass",
        "gravel",
        "ladder",
        "metal",
        "metal_box",
        "metal_grate",
        "mud",
        "plastic",
        "rubber",
        "sand",
        "snow",
        "tile",
        "vent",
        "water",
        "wood",
        "wood_panel"
    }

    local ways = {
        "walk",
        "run",
        "sprint",
        "jump",
        "land"
    }

    local volumes_forways =
    {
        ["walk"] = 0.25,
        ["run"] = 0.55,
        ["sprint"] = 0.75,
        ["jump"] = 0.25,
        ["land"] = 0.75
    }

    local cloth_layer =
    {
        ["walk"] = 0.10,
        ["run"] = 0.15,
        ["sprint"] = 0.25,
    }

    local levels_forways =
    {
        ["walk"] = 65,
        ["run"] = 75,
        ["sprint"] = 80,
        ["jump"] = 45,
        ["land"] = 50
    }

    local ladder_ways = {
        "hands",
        "foot"
    }

    local foot = {
        "l",
        "r"
    }

    -- // Bruh i forgot about random sound inside of sound scripts (so i've made multiple sounds instead of array in sound variable)

    -- // Create sounds
    for i = 1, 6 do
        for _, t in pairs(types) do
            for _, w in pairs(ways) do
                for _, f in pairs(foot) do
                    if w == "land" or w == "jump" then continue end
                    sound.Add( {
                        name = "mfw." .. t .. "_" .. w .."_" .. f .. i,
                        channel = CHAN_AUTO,
                        volume = volumes_forways[w],
                        level = levels_forways[w],
                        pitch = 100,
                        sound = "foley/foot/" .. t .. "/step_" .. w .. "_" .. t .. "_".. f .. "_0" .. i .. ".wav"
                    } )
                end
            end
        end
    end
    
    -- // Gear accent n cloth
    for i = 1, 9 do
        for _, w in pairs(ways) do
            if w == "land" or w == "jump" then continue end
            sound.Add( {
                name = "mfwmvmt.pre_" .. w .. i,
                channel = CHAN_AUTO,
                volume = cloth_layer[w],
                level = 50,
                pitch = 100,
                sound = "foley/mvmt/cloth/" .. w .. "/mvmtstep_cloth_plr_" .. w .. "_pre_0" .. i .. ".wav"
            } )
        end
    end

    for i = 1, 9 do
        for _, w in pairs(ways) do
            if w == "land" or w == "jump" then continue end
            sound.Add( {
                name = "mfwmvmt.post_" .. w .. i,
                channel = CHAN_AUTO,
                volume = cloth_layer[w],
                level = 50,
                pitch = 100,
                sound = "foley/mvmt/cloth/" .. w .. "/mvmtstep_cloth_plr_" .. w .. "_post_0" .. i .. ".wav"
            } )
        end
    end

    for i = 1,20 do
        sound.Add({
            name = "mfwmvmt.gear_accent" .. i,
            channel = CHAN_AUTO,
            volume = 1,
            level = 30,
            pitch = {95, 105},
            sound = "foley/mvmt/accents/gear_accent" .. i .. ".wav"
        })
    end

    -- // New. NPC
    for i = 1, 6 do
        for _, t in pairs(types) do
            for _, w in pairs(ways) do
                for _, f in pairs(foot) do
                    if w == "land" or w == "jump" then continue end
                    sound.Add( {
                        name = "mfw.npc" .. t .. "_" .. w .."_" .. f .. i,
                        channel = CHAN_AUTO,
                        volume = 0.5,
                        level = 75,
                        pitch = 100,
                        sound = "foley/foot/" .. t .. "/npc/step_" .. w .. "_" .. t .. "_".. f .. "_npc_0" .. i .. ".wav"
                    } )
                end
            end
        end
    end

    -- // Create land and jump sounds
    for i = 1, 5 do
        for _, t in pairs(types) do
            for _, w in pairs(ways) do
                if (w != "land" and w != "jump") then continue end
                local vlm = volumes_forways[w]

                sound.Add( {
                    name = "mfw." .. t .. "_" .. w .."_" .. i,
                    channel = CHAN_AUTO,
                    volume = vlm,
                    level = 90,
                    pitch = 100,
                    sound = "foley/foot/" .. t .. "/step_" .. w .. "_" .. t .. "_0" .. i .. ".wav"
                } )
            end
        end
    end

    -- // Create ladder sounds
    for i = 1, 5 do
        for _, w in pairs(ladder_ways) do
            for _, f in pairs(foot) do
                sound.Add( {
                    name = "mfw.ladder_" .. w .. "_" .. f .. "_0" .. i,
                    channel = CHAN_AUTO,
                    volume = 1.0,
                    level = 90,
                    pitch = 100,
                    sound = "foley/foot/ladder/step_climb_" .. w .. "_ladder_" .. f .. "_0" .. i .. ".wav"
                } ) 
            end
        end
    end

    -- // Falldamage
    sound.Add( {
        name = "Player.FallDamage",
        channel = CHAN_AUTO,
        volume = 1.0,
        level = 90,
        pitch = 100,
        sound = { "foley/foot/damage/step_land_damage_01.wav",
        "foley/foot/damage/step_land_damage_02.wav" }
    } )
 
    sound.Add( {
        name = "Player.FallGib",
        channel = CHAN_AUTO,
        volume = 1.0,
        level = 90,
        pitch = 100,
        sound = { "foley/foot/damage/step_land_damage_death_01.wav",
        "foley/foot/damage/step_land_damage_death_02.wav" }
    } )   

    hook.Add( "PlayerFootstep", "MFW_Footsteps", function( ply, pos, foot, sound, volume, rf )
        return true --stops the original footsteps from playing
    end)

    hook.Add( "EntityEmitSound", "MFW_EntityEmitSound", function( data )
        if not data.Entity:IsNPC() then return end

        local ent = data.Entity
        local soundName = data.SoundName

        local way = "sprint"

        ent.MFW_Step = "l"

        local material = ""

        for k, v in pairs(MFW.Footsteps) do
            if (string.StartWith(soundName, k)) then
                material = v
            end
        end
        
        for k, v in pairs(MFW.Footsteps) do
            if string.StartWith(soundName, k) and ent:IsNPC() then
                ent:EmitSound("mfw.npc" .. material .. "_" .. way .. "_" .. ent.MFW_Step .. math.random(1,6))
                return false
            end
        end
    end)
end

if SERVER then
    local footsteps_int = 
    {
        [MAT_CONCRETE] = "concrete",
        [MAT_METAL] = "metal",
        [MAT_TILE] = "tile",
        [MAT_WOOD] = "wood",
        [MAT_DIRT] = "dirt",
        [MAT_GRASS] = "grass",
        [MAT_GLASS] = "glass",
        [MAT_VENT] = "vent",
        [MAT_SAND] = "sand",
        [MAT_GRATE] = "metal_grate",
        [MAT_SNOW] = "snow",
        [MAT_PLASTIC] = "plastic"
    }

    hook.Add( "PlayerFootstep", "MFW_Footsteps", function( ply, pos, foot, sound, volume, rf )
        -- Current leg
        local step = "l"
        if (foot == 1) then step = "r" end

        -- Current material
        local material = ""

        for k, v in pairs(MFW.Footsteps) do
            if (string.StartWith(sound, k)) then
                material = v
            end
        end

        -- Current way to move
        local way = ""

        if math.floor(ply:GetVelocity():Length()) > ply:GetWalkSpeed() + 100 then
            way = "sprint"
        elseif math.floor(ply:GetVelocity():Length()) < ply:GetWalkSpeed() - 50 then
            way = "walk"
        else
            way = "run"
        end

        -- Jumped
        if GetPredictionPlayer() != NULL or !IsFirstTimePredicted() then
            local cmd = ply:GetCurrentCommand()
            local button = cmd:GetButtons()

            if bit.band(cmd:GetButtons(), IN_JUMP) ~= 0 then
                ply:EmitSound("mfw." .. material .. "_jump_" .. math.random(1,5))
                return true
            end
        end

        -- Ladder
        if string.StartWith(sound, "player/footsteps/ladder") then
            ply:EmitSound("mfw.ladder_hands_" .. step .. "_0" .. math.random(1,5))
            ply:EmitSound("mfwmvmt.gear_accent" .. math.random(1,20))
            timer.Simple(0.25, function()
                ply:EmitSound("mfw.ladder_foot_" .. step .. "_0" .. math.random(1,5))
            end)

            return true
        end

        -- Footstep
        ply:EmitSound("mfw." .. material .. "_" .. way .. "_" .. step .. math.random(1,6))
        ply:EmitSound("mfwmvmt.gear_accent" .. math.random(1,20))
        ply:EmitSound("mfwmvmt.pre_" .. way .. math.random(1,9))
        timer.Simple(0.1, function()
            ply:EmitSound("mfwmvmt.post_" .. way .. math.random(1,9))
        end)

        return true
    end)

    hook.Add( "OnPlayerHitGround", "MFW_Land", function( ply, speed )
        local tr = util.TraceLine( {
            start = ply:GetPos(),
            endpos = ply:GetPos() + ply:GetAngles():Up() * -10
        } )

        if (ply:WaterLevel() == 1) then
            ply:EmitSound("mfw.water_land_" .. math.random(1,5))
        end

        if (footsteps_int[tr.MatType] == nil) then return end

        ply:EmitSound("mfw." .. footsteps_int[tr.MatType] .. "_land_" .. math.random(1,5)) 
    end)

    function MWF_Delay(ply, type, walking)
       if engine.ActiveGamemode() != "beatrun" then
        local delay = 325

        if math.floor(ply:GetVelocity():Length()) > ply:GetWalkSpeed() + 100 then
            delay = 235
        elseif math.floor(ply:GetVelocity():Length()) < ply:GetWalkSpeed() - 50 then
            delay = 450
        end

        return delay
       end
    end
    
    hook.Add("PlayerStepSoundTime", "MWF_Delay", MWF_Delay)

end