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

    if mods["fluid-memory-storage"] then
        kl.qrecipe("fluid-memory-unit",{"storage-tank",1,"energy-shield-equipment",1,"efficiency-module",1},{"fluid-memory-unit",4},{rt="name-and-amount"})
    end
end



if mods["Dectorio"] then
    kl.qrecipe("dect-wood-floor",{"wood",10},{"dect-wood-floor",50},{rt="name-and-amount"})
    local base_tiles ={
        "dirt-1","dirt-2","dirt-3","dirt-4","dirt-5","dirt-6","dirt-7",
        "grass-1","grass-2","grass-3","grass-4",
        "dry-dirt",
        "sand-1","sand-2","sand-3",
        "red-desert-0","red-desert-1","red-desert-2","red-desert-3"
    }
    for _, tile in pairs(base_tiles) do
        if data.raw["tile"][tile] then
            kl.qrecipe("dect-base-"..tile,{"stone",1},{"dect-base-"..tile,50},{en=5,rt="name-and-amount"})
        end
    end

    local water_tiles = {"water", "deepwater", "water-green", "deepwater-green"}
    for _, tile in pairs(water_tiles) do
        if data.raw["tile"][tile] then
            kl.qrecipe("dect-base-"..tile,{"f","water",100},{"dect-base-"..tile,5},{en=10,cat="crafting-with-fluid",it="type-name-amounts",rt="name-and-amount"})
        end
    end

    local function entity_ingredients(type,name,mult)
        local entity = data.raw[type][name]
        local ingredients = {}
        if entity.minable then
            if entity.minable.results then
                for _, result in pairs(entity.minable.results) do
                    table.insert(ingredients,result.name)
                    if result.amount_max then
                        table.insert(ingredients,result.amount_max*mult)
                    elseif result.amount then
                        table.insert(ingredients,result.amount*mult)
                    end
                end
            elseif entity.minable.result then
                table.insert(ingredients,entity.minable.result)
                table.insert(ingredients,entity.minable.count*mult)
            end
        end
        return ingredients
    end

    local base_trees = {
        "tree-01","tree-02","tree-03","tree-04","tree-05","tree-06","tree-07","tree-08","tree-09",
        "dead-dry-hairy-tree","dead-grey-trunk","dead-tree-desert",
        "dry-hairy-tree","dry-tree",
        "tree-02-red","tree-08-red","tree-09-red",
        "tree-06-brown","tree-08-brown","tree-09-brown"
    }
    for _, tree in pairs(base_trees) do
        kl.qrecipe("dect-base-"..tree,entity_ingredients("tree",tree,4),{"dect-base-"..tree,5},{en=2,rt="name-and-amount"})
    end
    local base_rocks = {"huge-rock", "big-rock", "big-sand-rock"}
    for _, rock in pairs(base_rocks) do
        kl.qrecipe("dect-base-"..rock,entity_ingredients("simple-entity",rock,4),{"dect-base-"..rock,5},{en=2,rt="name-and-amount"})
    end

    kl.qrecipe("dect-concrete-wall",{"concrete",5,"iron-stick",2},{"dect-concrete-wall",5},{rt="name-and-amount"})
    kl.qrecipe("dect-concrete-wall-from-stone-wall",{"concrete",2,"stone-wall",1},{"dect-concrete-wall",5},{rt="name-and-amount"})
    kl.qrecipe("dect-concrete-wall-from-stone-wall",{"concrete",2,"stone-wall",1},{"dect-concrete-wall",5},{rt="name-and-amount"})
    kl.qrecipe("dect-chain-wall",{"iron-stick",2,"steel-plate",2},{"dect-chain-wall",5},{rt="name-and-amount"})
    kl.qrecipe("dect-wood-wall",{"wood",3},{"dect-wood-wall",5},{rt="name-and-amount"})
    kl.qrecipe("dect-concrete-gate",{"dect-concrete-wall",1,"steel-plate",2,"electronic-circuit",2},{"dect-concrete-gate",5},{rt="name-and-amount"})
    kl.qrecipe("dect-concrete-gate-from-stone-gate",{"gate",1,"concrete",2,"electronic-circuit",1},{"dect-concrete-gate",5},{rt="name-and-amount"})

    local alien_biomes = {
        "mineral-purple-dirt-1", "mineral-purple-dirt-2", "mineral-purple-dirt-3", "mineral-purple-dirt-4", "mineral-purple-dirt-5", "mineral-purple-dirt-6", "mineral-purple-sand-1", "mineral-purple-sand-2", "mineral-purple-sand-3",
        "mineral-violet-dirt-1", "mineral-violet-dirt-2", "mineral-violet-dirt-3", "mineral-violet-dirt-4", "mineral-violet-dirt-5", "mineral-violet-dirt-6", "mineral-violet-sand-1", "mineral-violet-sand-2", "mineral-violet-sand-3",
        "mineral-red-dirt-1", "mineral-red-dirt-2", "mineral-red-dirt-3", "mineral-red-dirt-4", "mineral-red-dirt-5", "mineral-red-dirt-6", "mineral-red-sand-1", "mineral-red-sand-2", "mineral-red-sand-3",
        "mineral-brown-dirt-1", "mineral-brown-dirt-2", "mineral-brown-dirt-3", "mineral-brown-dirt-4", "mineral-brown-dirt-5", "mineral-brown-dirt-6", "mineral-brown-sand-1", "mineral-brown-sand-2", "mineral-brown-sand-3",
        "mineral-tan-dirt-1", "mineral-tan-dirt-2", "mineral-tan-dirt-3", "mineral-tan-dirt-4", "mineral-tan-dirt-5", "mineral-tan-dirt-6", "mineral-tan-sand-1", "mineral-tan-sand-2", "mineral-tan-sand-3",
        "mineral-aubergine-dirt-1", "mineral-aubergine-dirt-2", "mineral-aubergine-dirt-3", "mineral-aubergine-dirt-4", "mineral-aubergine-dirt-5", "mineral-aubergine-dirt-6", "mineral-aubergine-sand-1", "mineral-aubergine-sand-2", "mineral-aubergine-sand-3",
        "mineral-dustyrose-dirt-1", "mineral-dustyrose-dirt-2", "mineral-dustyrose-dirt-3", "mineral-dustyrose-dirt-4", "mineral-dustyrose-dirt-5", "mineral-dustyrose-dirt-6", "mineral-dustyrose-sand-1", "mineral-dustyrose-sand-2", "mineral-dustyrose-sand-3",
        "mineral-beige-dirt-1", "mineral-beige-dirt-2", "mineral-beige-dirt-3", "mineral-beige-dirt-4", "mineral-beige-dirt-5", "mineral-beige-dirt-6", "mineral-beige-sand-1", "mineral-beige-sand-2", "mineral-beige-sand-3",
        "mineral-cream-dirt-1", "mineral-cream-dirt-2", "mineral-cream-dirt-3", "mineral-cream-dirt-4", "mineral-cream-dirt-5", "mineral-cream-dirt-6", "mineral-cream-sand-1", "mineral-cream-sand-2", "mineral-cream-sand-3",
        "mineral-black-dirt-1", "mineral-black-dirt-2", "mineral-black-dirt-3", "mineral-black-dirt-4", "mineral-black-dirt-5", "mineral-black-dirt-6", "mineral-black-sand-1", "mineral-black-sand-2", "mineral-black-sand-3",
        "mineral-grey-dirt-1", "mineral-grey-dirt-2", "mineral-grey-dirt-3", "mineral-grey-dirt-4", "mineral-grey-dirt-5", "mineral-grey-dirt-6", "mineral-grey-sand-1", "mineral-grey-sand-2", "mineral-grey-sand-3",
        "mineral-white-dirt-1", "mineral-white-dirt-2", "mineral-white-dirt-3", "mineral-white-dirt-4", "mineral-white-dirt-5", "mineral-white-dirt-6", "mineral-white-sand-1", "mineral-white-sand-2", "mineral-white-sand-3",
        "vegetation-turquoise-grass-1", "vegetation-turquoise-grass-2", "vegetation-turquoise-grass-3", "vegetation-turquoise-grass-4",
        "vegetation-green-grass-1", "vegetation-green-grass-2", "vegetation-green-grass-3", "vegetation-green-grass-4",
        "vegetation-olive-grass-1", "vegetation-olive-grass-2",
        "vegetation-yellow-grass-1", "vegetation-yellow-grass-2",
        "vegetation-orange-grass-1", "vegetation-orange-grass-2",
        "vegetation-red-grass-1", "vegetation-red-grass-2",
        "vegetation-violet-grass-1", "vegetation-violet-grass-2",
        "vegetation-purple-grass-1", "vegetation-purple-grass-2",
        "vegetation-mauve-grass-1", "vegetation-mauve-grass-2",
        "vegetation-blue-grass-1", "vegetation-blue-grass-2",
        "volcanic-orange-heat-1", "volcanic-orange-heat-2", "volcanic-orange-heat-3", "volcanic-orange-heat-4",
        "volcanic-green-heat-1", "volcanic-green-heat-2", "volcanic-green-heat-3", "volcanic-green-heat-4",
        "volcanic-blue-heat-1", "volcanic-blue-heat-2", "volcanic-blue-heat-3", "volcanic-blue-heat-4",
        "volcanic-purple-heat-1", "volcanic-purple-heat-2", "volcanic-purple-heat-3", "volcanic-purple-heat-4",
        "frozen-snow-0", "frozen-snow-1", "frozen-snow-2", "frozen-snow-3", "frozen-snow-4", "frozen-snow-5", "frozen-snow-6", "frozen-snow-7", "frozen-snow-8", "frozen-snow-9"
    }
    for _, tile in pairs(alien_biomes) do
        if data.raw["tile"][tile] then
            kl.qrecipe("dect-alien-biomes-"..tile,{"stone",1},{"dect-alien-biomes-"..tile,50},{en=5,rt="name-and-amount"})
        end
    end

    local trees = {"tree-wetland-a", "tree-wetland-b", "tree-wetland-c", "tree-wetland-d", "tree-wetland-e", "tree-wetland-f", "tree-wetland-g", "tree-wetland-h", "tree-wetland-i", "tree-wetland-j", "tree-wetland-k", "tree-wetland-l", "tree-wetland-m", "tree-wetland-n", "tree-wetland-o",
        "tree-grassland-a", "tree-grassland-b", "tree-grassland-c", "tree-grassland-d", "tree-grassland-e", "tree-grassland-f", "tree-grassland-g", "tree-grassland-h", "tree-grassland-i", "tree-grassland-j", "tree-grassland-k", "tree-grassland-l", "tree-grassland-m", "tree-grassland-n", "tree-grassland-o", "tree-grassland-p", "tree-grassland-q",
        "tree-dryland-a", "tree-dryland-b", "tree-dryland-c", "tree-dryland-d", "tree-dryland-e", "tree-dryland-f", "tree-dryland-g", "tree-dryland-h", "tree-dryland-i", "tree-dryland-j", "tree-dryland-k", "tree-dryland-l", "tree-dryland-m", "tree-dryland-n", "tree-dryland-o",
        "tree-desert-a", "tree-desert-b", "tree-desert-c", "tree-desert-d", "tree-desert-e", "tree-desert-f", "tree-desert-g", "tree-desert-h", "tree-desert-i", "tree-desert-j", "tree-desert-k", "tree-desert-l", "tree-desert-m", "tree-desert-n",
        "tree-snow-a", "tree-volcanic-a",
        "tree-palm-a", "tree-palm-b"
    }
    for _, tree in pairs(trees) do
        if data.raw["tree"][tree] then
            kl.qrecipe("dect-alien-biomes-"..tree,entity_ingredients("tree",tree,4),{"dect-alien-biomes-"..tree,5},{en=2,rt="name-and-amount"})
        end
    end

    local rocks = {}
    local rock_prototypes = {"rock-huge", "rock-big"}
    local tints = {
        tan = {193,162,127},
        white = {255,255,255},
        grey = {177,183,187},
        black = {135,135,135},
        purple = {169,177,239},
        red = {185,107,105},
        violet = {165,107,161},
        dustyrose = {180,148,137},
        cream = {234,216,179},
        brown = {162,117,88},
        beige = {178,164,138},
        aubergine = {126,115,156}
    }
    for _, rock in pairs(rock_prototypes) do
        for tint, color in pairs(tints) do
            table.insert(rocks, { name=rock.."-"..tint, tint=tint, color=color, prototype=rock })
        end
    end

    for _, rock in pairs(rocks) do
        if data.raw["simple-entity"][rock.name] then
            kl.qrecipe("dect-alien-biomes-"..rock.name,entity_ingredients("simple-entity",rock.name,4),{"dect-alien-biomes-"..rock.name,5},{en=2,rt="name-and-amount"})
        end
    end
end
