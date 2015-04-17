window.onload = ->

  DEFAULT_TAB_LIMIT = 9

  localStorage.tabLimit or= DEFAULT_TAB_LIMIT

  setInputValue = ->
    document
      .getElementById('tabLimitInput')
      .value = localStorage.tabLimit
  setInputValue()

  tabLimitInput = document.getElementById('tabLimitInput')

  handleInputChange = ->
    newValue = parseInt(tabLimitInput.value, 10)
    if newValue is 0 then newValue = 1
    if newValue < 0 then newValue *= -1
    if newValue >= 1000 then newValue = 999
    localStorage.tabLimit = newValue or localStorage.tabLimit
    setInputValue()

  tabLimitInput.addEventListener 'change', handleInputChange

  document.getElementById('tabLimitInput').addEventListener('change',alert)
