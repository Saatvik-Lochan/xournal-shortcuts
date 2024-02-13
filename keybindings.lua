Mappings = {
  actions = {
    -- Top row
    ["q"] = "DELETE",
    ["w"] = "UNDO",
    -- f, p in raw
    ["b"] = "TOOL_ERASER",

    ["<Ctrl>w"] = "REDO",

    -- Middle row
    ["a"] = "TOOL_DRAW_ARROW",
    ["r"] = "COPY",
    ["s"] = "PASTE",
    ["t"] = "TOOL_SELECT_RECT",
    ["g"] = "TOOL_LINE_STYLE_PLAIN",

    ["<Ctrl>t"] = "TOOL_SELECT_REGION",

    ["e"] = "TOOL_TEXT",
    ["x"] = "TEX",

    -- Lower rows 
    ["d"] = "TOOL_HAND", -- I think space is already bound to something
  },
  cycle = {
    ["]"] = {
      "TOOL_PEN_SIZE_MEDIUM", -- these could be of the form { "SIZE_MEDIUM", false } to set the enable state
      "TOOL_PEN_SIZE_THICK",
    }
  },
  raw = { -- You must respect AllEnabled manually in raw
    ["f"] = function () -- toggle between blue and black
      changePen("MEDIUM", 0x000000)
      RedPenNext = true
    end,

    ["p"] = function () -- toggle between blue and black
      changePen("MEDIUM", 0x3333cc)
      RedPenNext = true
    end,

    ["v"] = function ()
      if RedPenNext then
        changePen("MEDIUM", 0xff0000)
      else
        changePen("THICK", 0x4f9e7e)
      end

      RedPenNext = not RedPenNext
    end,
  }
}
