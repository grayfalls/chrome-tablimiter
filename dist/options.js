window.onload = function() {
  var DEFAULT_TAB_LIMIT, handleInputChange, setInputValue, tabLimitInput;
  DEFAULT_TAB_LIMIT = 9;
  localStorage.tabLimit || (localStorage.tabLimit = DEFAULT_TAB_LIMIT);
  setInputValue = function() {
    return document.getElementById('tabLimitInput').value = localStorage.tabLimit;
  };
  setInputValue();
  tabLimitInput = document.getElementById('tabLimitInput');
  handleInputChange = function() {
    var newValue;
    newValue = parseInt(tabLimitInput.value, 10);
    if (newValue === 0) {
      newValue = 1;
    }
    if (newValue < 0) {
      newValue *= -1;
    }
    if (newValue >= 1000) {
      newValue = 999;
    }
    localStorage.tabLimit = newValue || localStorage.tabLimit;
    return setInputValue();
  };
  tabLimitInput.addEventListener('change', handleInputChange);
  return document.getElementById('tabLimitInput').addEventListener('change', alert);
};
