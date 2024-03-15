-- ======================================= Reload on save
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")


-- ======================================= Define Hyper
local hyper = {"ctrl", "alt", "cmd", "shift"}

--  function to either open apps or switch through them using switcher
function openswitch(name)
    return function()
        if hs.application.frontmostApplication():name() == name then
          switcherfunc()
        else
          hs.application.launchOrFocus(name)
        end
    end
end

hs.hotkey.bind(hyper, "f", openswitch("Firefox.app"))
hs.hotkey.bind(hyper, "g", openswitch("Thorium.app"))
hs.hotkey.bind(hyper, "c", openswitch("Visual Studio Code"))
hs.hotkey.bind(hyper, "t", openswitch("kitty"))
hs.hotkey.bind(hyper, "l", openswitch("Logseq"))
hs.hotkey.bind(hyper, "w", openswitch("Workflowy"))
hs.hotkey.bind(hyper, "m", openswitch("Spotify"))
hs.hotkey.bind(hyper, "b", openswitch("Books"))

-- Miro Windows Manager
-- https://github.com/miromannino/miro-windows-manager/tree/master/MiroWindowsManager.spoon
hs.loadSpoon("MiroWindowsManager")

spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "a"},
  nextscreen = {hyper, "n"}
})


-- ======================================= Utilities
-- disable window animations
hs.window.animationDuration = 0
