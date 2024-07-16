local M = {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = { "markdown", "md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp"
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "c:/Repos/Notes/",
        },
      },
      note_id_func = function (title)
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = tostring(os.time()) .. "-" .. string.char(math.random(65, 90))
          end
        end
        return suffix
      end,
      disable_frontmatter = true,
    }
  }

return M
