var DEFAULT_TAB_LIMIT, checkTabs, removeExtraTabs, setTabLimits, tabLimiter_checking, tabLimiter_tabLimit;

DEFAULT_TAB_LIMIT = 9;

tabLimiter_tabLimit = DEFAULT_TAB_LIMIT;

tabLimiter_checking = false;

setTabLimits = function() {
  localStorage.tabLimit || (localStorage.tabLimit = DEFAULT_TAB_LIMIT);
  return tabLimiter_tabLimit = parseInt(localStorage.tabLimit, 10);
};

setTabLimits();

removeExtraTabs = function() {
  return chrome.tabs.query({
    currentWindow: true
  }, function(tabs) {
    var i, j, ref, ref1, results;
    if (!tabs.length) {
      return;
    }
    if (tabs.length > tabLimiter_tabLimit) {
      tabs.sort(function(a, b) {
        return parseInt(a.id) - parseInt(b.id);
      });
      results = [];
      for (i = j = ref = tabLimiter_tabLimit, ref1 = tabs.length - 1; ref <= ref1 ? j <= ref1 : j >= ref1; i = ref <= ref1 ? ++j : --j) {
        results.push(chrome.tabs.remove(tabs[i].id));
      }
      return results;
    }
  });
};

checkTabs = function() {
  if (tabLimiter_checking) {
    return;
  }
  setTabLimits();
  tabLimiter_checking = true;
  removeExtraTabs();
  return tabLimiter_checking = false;
};

chrome.tabs.onUpdated.addListener(checkTabs);
