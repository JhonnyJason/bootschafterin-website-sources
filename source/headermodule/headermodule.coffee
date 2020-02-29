headermodule = {name: "headermodule"}

#region modulesFromTheEnvironment
utl = null
#endregion

#region HTMLElements
menu = null

companySection = null
companyLink = null

servicesSection = null
servicesLink = null

partnerSection = null
partnerLink = null

contactBlock = null
contactLink = null
#endregion

#region printLogFunctions
##############################################################################
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["headermodule"]?  then console.log "[headermodule]: " + arg
    return
print = (arg) -> console.log(arg)
#endregion
##############################################################################
headermodule.initialize = () ->
    log "headermodule.initialize"
    utl = allModules.vanillautilmodule
    menu = document.getElementById("menu")

    companySection = document.getElementById("company-section")
    companyLink = document.getElementById("menu-link-company")

    servicesSection = document.getElementById("services-section")
    servicesLink = document.getElementById("menu-link-services")

    partnerSection = document.getElementById("partner-section")
    partnerLink = document.getElementById("menu-link-partner")

    contactBlock = document.getElementById("contact-block")
    contactLink = document.getElementById("menu-link-contact")

    servicesLink.addEventListener("click", servicesClicked)
    companyLink.addEventListener("click", companyClicked)
    partnerLink.addEventListener("click", partnerClicked)
    contactLink.addEventListener("click", kontaktClicked)

    document.addEventListener("scroll", onScroll)
    menu.addEventListener("click", menuClicked)
    return

#region internalProperties
isCollapsed = false
#endregion
    
#region internalFunctions
onScroll = ->
    log "onScroll"
    return if isCollapsed
    menu.classList.add("collapsed")
    isCollapsed = true
    return

menuClicked = ->
    log "menuClicked"
    return unless isCollapsed
    menu.classList.remove("collapsed")
    isCollapsed = false
    return

partnerClicked = ->
    log "partnerClicked"
    utl.scrollTo(partnerSection)
    return

companyClicked = ->
    log "companyClicked"
    utl.scrollTo(companySection)
    return

servicesClicked = ->
    log "servicesClicked"
    utl.scrollTo(servicesSection)
    return

kontaktClicked = ->
    log "kontaktClicked"
    contactBlock.classList.add("lit")
    utl.scrollTo(contactBlock)
    setTimeout(unlitContactBlock, 800)
    return

unlitContactBlock = ->
    log "unlitContactBlock"
    contactBlock.classList.remove("lit")
    return
#endregion

#region exposedFunctions
#endregion

module.exports = headermodule




