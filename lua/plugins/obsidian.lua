local vault_path = os.getenv("OBSIDIAN_VAULT_PATH")

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vault_path .. "**.md" },
  opts = {
    dir = vault_path,
    notes_subdir = "Fleeting Notes",
    daily_notes = {
      folder = "Daily notes",
    },
    completion = {
      nvim_cmp = true,  -- if using nvim-cmp, otherwise set to false
    },
    -- Optional, for templates (see below).
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    --
    -- Optional, alternatively you can customize the frontmatter data.
    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

  },
  config = function (_, opts)
    require('obsidian').setup(opts)
    -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
    -- see also: 'follow_url_func' config option above.
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end,
      { noremap = false, expr = true })
  end
}
