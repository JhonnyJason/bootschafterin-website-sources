import Modules from "./allmodules"

global.allModules = Modules


window.onload = ->
    promises = (m.initialize() for n,m of Modules when m.initialize?)
    await Promise.all(promises)
    appStartup()


appStartup = ->
    ## which modules shall be kickstarted?
    return
