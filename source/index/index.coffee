import Modules from "./allmodules"

global.allModules = Modules


window.onload = ->
    promises = (m.initialize() for n,m of Modules)
    await Promise.all(promises)
    appStartup()

postData = (url = '', data = {}) ->
    fetchOptions = 
        method: 'POST'#, // *GET, POST, PUT, DELETE, etc.
        mode: 'cors'#, // no-cors, *cors, same-origin
        cache: 'no-cache'#, // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin'#, // include, *same-origin, omit
        headers: { 'Content-Type': 'application/json'}
        redirect: 'follow'#, // manual, *follow, error
        referrerPolicy: 'no-referrer'#, // no-referrer, *client
        body: JSON.stringify(data) #// body data type must match "Content-Type" header

    response = await fetch(url, fetchOptions)
    return await response.json()#; // parses JSON response into native JavaScript objects


appStartup = ->
    ## which modules shall be kickstarted?
    data = 
        maxResults: 50
        searchString: "Gra"

    result = await postData('http://citysearch.test/citysearch', data)
    console.log JSON.stringify(result, null, 4)
    return
