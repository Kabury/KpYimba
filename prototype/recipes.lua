local kl = require("__klib__.klib")


if mods["factorissimo-2-notnotmelon"] then
    kl.qrecipe("factory-1",{"stone",50,"iron-plate",50,"copper-plate",20},nil,{en=30})
    kl.qrecipe("factory-2",{"factory-1",1,"stone-brick",100,"steel-plate",25,"big-electric-pole",5},nil,{en=45})
    kl.qrecipe("factory-3",{"factory-2",1,"concrete",500,"steel-plate",200,"substation",10},nil,{en=60})

    if mods["pypostprocessing"] then
        kl.qrecipe("factory-1",{"concrete",20,"steel-plate",5,"tinned-cable",5,"treated-wood",5},nil,{en=30})
        kl.qrecipe("factory-2",{"factory-1",1,"py-asphalt",15,"concrete-wall",5,"fiberboard",5,"bolts",20,"tinned-cable",5},nil,{en=45})
        kl.qrecipe("factory-3",{"factory-2",1,"intermetallics",5,"tinned-cable",5,"big-electric-pole",2,"fiberboard",10},nil,{en=60})
    end

    if mods["space-exploration"] then
        kl.qrecipe("space-factory-1",{"se-space-solar-panel",1,"se-aeroframe-pole",100,"se-heat-shielding",100,"se-space-platform-scaffold",30*3,"substation",5},nil,{en=30})
        kl.qrecipe("space-factory-2",{"se-space-solar-panel-2",2,"se-aeroframe-scaffold",150,"se-heat-shielding",150,"se-space-platform-plating",45*5,"se-pylon",5},nil,{en=45})
        kl.qrecipe("space-factory-3",{"se-space-solar-panel-3",3,"se-aeroframe-bulkhead",200,"se-heavy-composite",200,"se-spaceship-floor",60*6,"se-pylon-construction",5,"se-deep-space-transport-belt-black",1},nil,{en=60})
    elseif mods["space-age"] and not mods["space-is-fake"] then
        kl.qrecipe("space-factory-1", {"factory-1", 1, "low-density-structure", 50, "solar-panel", 1, "space-platform-foundation", 30}, nil, {en=30})
        kl.qrecipe("space-factory-2", {"factory-2", 1, "low-density-structure", 100, "solar-panel", 3, "space-platform-foundation", 60}, nil, {en=45})
        kl.qrecipe("space-factory-3", {"factory-3", 1, "low-density-structure", 200, "solar-panel", 5, "space-platform-foundation", 90}, nil, {en=60})
    end
end


if mods["pypostprocessing"] then
    if mods["AutomaticTrainDeployment_SpaceAge"] then
        local atd_ingredients={"train-stop",1,"electronic-circuit",5,"steel-plate",10}

        kl.qrecipe("atd-deployer",atd_ingredients)
        kl.qrecipe("atd-cleaner",atd_ingredients)
        kl.qrecipe("atd-source",atd_ingredients)
    end

    if mods["character-inventory-uplink"] then
        kl.qrecipe("character-inventory-uplink",{"iron-plate",50,"copper-cable",20,"electronic-circuit",5})
    end

    if mods["deep-storage-unit"] then
        kl.qrecipe("memory-unit",{"steel-chest",1,"energy-shield-equipment",1,"efficiency-module",4},{"memory-unit",2},{rt="name-and-amount"})
    end
end
