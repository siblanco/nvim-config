-- return {
--   "folke/flash.nvim",
--   event = "VeryLazy",
--   opts = {},
--   keys = {
--     { "s", false },
--     { "/", false },
--   },
--   -- stylua: ignore
--
--   config = function()
--     local Flash = require("flash")
--
--     local function format(opts)
--       -- always show first and second label
--       return {
--         { opts.match.label1, "FlashMatch" },
--         { opts.match.label2, "FlashLabel" },
--       }
--     end
--
--     vim.keymap.set({ "n", "v" }, "h", function()
--       Flash.jump({
--         search = { mode = "search" },
--         label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
--         pattern = [[\<]],
--         action = function(match, state)
--           state:hide()
--           Flash.jump({
--             search = { max_length = 0 },
--             highlight = { matches = false },
--             label = { format = format },
--             matcher = function(win)
--               -- limit matches to the current label
--               return vim.tbl_filter(function(m)
--                 return m.label == match.label and m.win == win
--               end, state.results)
--             end,
--             labeler = function(matches)
--               for _, m in ipairs(matches) do
--                 m.label = m.label2 -- use the second label
--               end
--             end,
--           })
--         end,
--         labeler = function(matches, state)
--           local labels = state:labels()
--           for m, match in ipairs(matches) do
--             match.label1 = labels[math.floor((m - 1) / #labels) + 1]
--             match.label2 = labels[(m - 1) % #labels + 1]
--             match.label = match.label1
--           end
--         end,
--       })
--     end)
--
--     vim.keymap.set({ "n", "v" }, "H", function()
--       require("flash").treesitter()
--     end)
--   end,
-- }

return {}
