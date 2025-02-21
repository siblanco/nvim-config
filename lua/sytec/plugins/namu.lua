return { -- Those are the default options
  "bassamsdata/namu.nvim",
  config = function()
    require("namu").setup({
      -- Enable symbols navigator which is the default
      namu_symbols = {
        enable = true,
        options = {
          AllowKinds = {
            default = {
              "Function",
              "Method",
              "Class",
              "Module",
              -- "Property",
              -- "Variable",
              -- "Constant",
              "Enum",
              "Interface",
              -- "Field",
              -- "Struct",
            },
            lua = { "Function", "Method", "Table", "Module" },
            python = { "Function", "Class", "Method" },
            -- Filetype specific
            yaml = { "Object", "Array" },
            json = { "Module" },
            toml = { "Object" },
            markdown = { "String" },
          },
          movement = { -- Support multiple keys
            next = { "<C-j>", "<DOWN>" },
            previous = { "<C-k>", "<UP>" },
            close = { "<ESC>" }, -- "<C-c>" can be added as well
            select = { "<CR>" },
            delete_word = {},    -- it can assign "<C-w>"
            clear_line = {},     -- it can be "<C-u>"
          },
          custom_keymaps = {
            codecompanion = {
              keys = "<C-o>",
              desc = "Add symbol to CodeCompanion",
            },
          },
          icon = "󱠦", -- 󱠦 -  -  -- 󰚟
          kindText = {
            Function = "function",
            Class = "class",
            Module = "module",
            Constructor = "constructor",
            Interface = "interface",
            Property = "property",
            Field = "field",
            Enum = "enum",
            Constant = "constant",
            Variable = "variable",
          },
          kindIcons = {
            File = "󰈙",
            Module = "󰏗",
            Namespace = "󰌗",
            Package = "󰏖",
            Class = "󰌗",
            Method = "󰆧",
            Property = "󰜢",
            Field = "󰜢",
            Constructor = "󰆧",
            Enum = "󰒻",
            Interface = "󰕘",
            Function = "󰊕",
            Variable = "󰀫",
            Constant = "󰏿",
            String = "󰀬",
            Number = "󰎠",
            Boolean = "󰨙",
            Array = "󰅪",
            Object = "󰅩",
            Key = "󰌋",
            Null = "󰟢",
            EnumMember = "󰒻",
            Struct = "󰌗",
            Event = "󰉁",
            Operator = "󰆕",
            TypeParameter = "󰊄",
          },
          highlight = "NamuPreview",
          highlights = {
            parent = "NamuParent",
            nested = "NamuNested",
            style = "NamuStyle",
          },
          kinds = {
            prefix_kind_colors = true,
            enable_highlights = true,
            highlights = {
              PrefixSymbol = "NamuPrefixSymbol",
              Function = "NamuSymbolFunction",
              Method = "NamuSymbolMethod",
              Class = "NamuSymbolClass",
              Interface = "NamuSymbolInterface",
              Variable = "NamuSymbolVariable",
              Constant = "NamuSymbolConstant",
              Property = "NamuSymbolProperty",
              Field = "NamuSymbolField",
              Enum = "NamuSymbolEnum",
              Module = "NamuSymbolModule",
            },
          },
        }
      },
      colorscheme = {
        enable = false,
        options = {
          -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
          persist = true,        -- very efficient mechanism to Remember selected colorscheme
          write_shada = false,   -- If you open multiple nvim instances, then probably you need to enable this
          excluded_schemes = {}, -- exclude any colorscheme from the list
          -- it accept the same row_position and movement keys as the one in namy symbols
        },
      },
      ui_select = { enable = false }, -- vim.ui.select() wrapper
    })

    vim.keymap.set("n", "<leader>n", ":Namu symbols<cr>", {
      desc = "Jump to LSP symbol",
      silent = true,
    })
  end,
}
