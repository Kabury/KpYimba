local kl = require("__klib__.klib")


if mods["pypostprocessing"] then
    if mods["AutomaticTrainDeployment_SpaceAge"] then
        data.raw["technology"]["automatic-train-deployment"].unit = (kl.qtech("_",150,kl.pyamounts[3],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["automatic-train-deployment"].prerequisites = {"railway"}
    end

    if mods["character-inventory-uplink"] then
        data.raw["technology"]["character-inventory-uplink"].unit = (kl.qtech("_",100,kl.pyamounts[2],{ret=true,order=kl.pyorder})).unit
    end

    if mods["factorissimo-2-notnotmelon"] then
        data.raw["technology"]["factory-architecture-t1"].unit          = (kl.qtech("_",50,{1},{ret=true})).unit
        data.raw["technology"]["factory-connection-type-fluid"].unit    = (kl.qtech("_",50,{1},{ret=true})).unit
        data.raw["technology"]["factory-architecture-t2"].unit          = (kl.qtech("_",150,kl.pyamounts[2],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-connection-type-circuit"].unit  = (kl.qtech("_",150,kl.pyamounts[2],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-interior-upgrade-display"].unit = (kl.qtech("_",50,kl.pyamounts[2],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-recursion-t1"].unit             = (kl.qtech("_",200,kl.pyamounts[2],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-recursion-t1"].prerequisites    = {"factory-architecture-t2","rubber"}
        data.raw["technology"]["factory-architecture-t3"].unit          = (kl.qtech("_",300,kl.pyamounts[3],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-architecture-t3"].prerequisites= {"factory-architecture-t2","logistic-science-pack"}
        data.raw["technology"]["factory-connection-type-chest"].unit    = (kl.qtech("_",100,kl.pyamounts[3],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-connection-type-chest"].prerequisites= {"factory-architecture-t2","logistic-system"}
        data.raw["technology"]["factory-interior-upgrade-roboport"].unit= (kl.qtech("_",200,kl.pyamounts[2],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-recursion-t2"].unit             = (kl.qtech("_",500,kl.pyamounts[4],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-connection-type-heat"].unit     = (kl.qtech("_",150,kl.pyamounts[4],{ret=true,order=kl.pyorder})).unit
        data.raw["technology"]["factory-connection-type-heat"].prerequisites = {"factory-architecture-t2"}
    end
end



