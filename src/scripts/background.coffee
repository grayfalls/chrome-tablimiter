DEFAULT_TAB_LIMIT = 9

tabLimiter_tabLimit = DEFAULT_TAB_LIMIT
tabLimiter_checking = false

setTabLimits = ->
  localStorage.tabLimit or= DEFAULT_TAB_LIMIT
  tabLimiter_tabLimit = parseInt(localStorage.tabLimit, 10)
setTabLimits()

removeExtraTabs = ->
  chrome.tabs.query {currentWindow: true}, (tabs) ->
    if !tabs.length then return

    if tabs.length > tabLimiter_tabLimit
      # sort the tabs by ID
      tabs.sort (a,b) -> parseInt(a.id) - parseInt(b.id)

      # remove all extra tabs
      for i in [tabLimiter_tabLimit .. tabs.length-1]
        chrome.tabs.remove(tabs[i].id)

checkTabs = ->
  if tabLimiter_checking then return
  setTabLimits()

  tabLimiter_checking = true
  removeExtraTabs()
  tabLimiter_checking = false

chrome.tabs.onUpdated.addListener checkTabs
