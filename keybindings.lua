Mappings = {
  actions = {
    -- Find list of possible actions in 'actions.txt'
    -- Top row
    ["q"] = "DELETE",
    ["w"] = "UNDO",

    ["<Ctrl>w"] = "REDO",

    -- Middle row
    ["r"] = "COPY",
    ["s"] = "PASTE",
    ["t"] = "TOOL_SELECT_RECT",

    ["<Ctrl>t"] = "TOOL_SELECT_REGION",

    ["e"] = "TOOL_TEXT",

    -- Lower rows 
    ["v"] = "TOOL_ERASER",
    ["d"] = "TOOL_HAND",
    ["x"] = "TEX",

    -- I don't think you can bind "space"
  },
  cycle = {
    -- Note that binds described here maintain their own toggle state
    -- i.e. They blindly switch between the two actions, regardless of what
    -- state xournal is currently in. 
    --
    -- An example would be toggle DRAW_ARROW to 'true', then externally disabling it.
    -- The next time you toggle DRAW_ARROW it fill set it to 'false' even if the arrow
    -- tool is currently not selected
    ["]"] = {
      "TOOL_PEN_SIZE_MEDIUM",
      "TOOL_PEN_SIZE_THICK",
    },
    ["a"] = { -- basic toggle pattern
      { "TOOL_DRAW_ARROW", true },
      { "TOOL_DRAW_ARROW", false },
    },
  },
  raw = {
    -- You can call 'actions' by using app.uiAction. 
    -- E.g. app.uiAction({ action = "ACTION_TOOL_HAND", enabled = true })
    -- Note that I prepended ACTION_ to the action 'TOOL_HAND' shown in actions.txt
    --
    -- See the lua reference for more information: https://www.lua.org/manual/
    -- xournal++ plugin reference: https://xournalpp.github.io/guide/plugins/plugins/

    ["f"] = function ()
      changePen("MEDIUM", 0x000000) -- convenience function, check README for option on thickness
      RedPenNext = true -- variables are global, if you don't prepend a 'local' to them
    end,

    ["p"] = function ()
      changePen("MEDIUM", 0x3333cc)
      RedPenNext = true
    end,

    ["b"] = function ()
      if RedPenNext then
        changePen("MEDIUM", 0xff0000)
      else
        changePen("THICK", 0x4f9e7e)
      end

      RedPenNext = not RedPenNext
    end,

    ["g"] = function () -- example of manually implementing a toggle style function
      if not RulerEnabled then
        app.uiAction({ action = "ACTION_RULER" })
        print("ruler enabled")
      else
        -- This is a weird workaround, since it seems you can't normally disable the ruler
        app.uiAction({ action = "ACTION_TOOL_DRAW_ARROW", enabled = true })
        app.uiAction({ action = "ACTION_TOOL_DRAW_ARROW", enabled = false })

        print("disabled ruler") -- you can see this if you launch xournalpp from the cmdline
      end

      RulerEnabled = not RulerEnabled
    end,
  }
}
