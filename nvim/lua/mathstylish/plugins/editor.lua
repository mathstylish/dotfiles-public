local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make CC=gcc" },
  },
  opts = {
    defaults = {
      initial_mode = "insert",
      mappings = {
        n = {
          ["q"] = "close",
          ["<C-j>"] = "preview_scrolling_down",
          ["<C-k>"] = "preview_scrolling_up",
          ["o"] = "select_default",
          ["s"] = "select_vertical",
          ["v"] = "select_horizontal",
        },
        i = {
          ["<C-c>"] = "close",
          ["<C-f>"] = "preview_scrolling_down",
          ["<C-b>"] = "preview_scrolling_up",
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
          ["<C-o>"] = "select_default",
          ["<C-s>"] = "select_vertical",
          ["<C-v>"] = "select_horizontal",
        },
      },
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({
          no_ignore = false,
          file_ignore_patterns = {
            ".git/.*",
            "node_modules/.*",
          },
          hidden = true,
          layout_config = {
            width = 0.75,
            horizontal = {
              preview_width = 0.55,
            },
          },
        })
      end,
    },
    {
      "<leader>ft",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").man_pages()
      end,
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
    },
    {
      ";;",
      mode = { "n", "x", "v" },
      function()
        require("telescope.builtin").resume()
      end,
    },
  },
  init = function()
    require("telescope").load_extension("fzf")
  end,
}

local nvim_spectre = {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "Replace in Files (Spectre)",
    },
  },
}

local flash = {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>a",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#FF0000", bg = "NONE" })
  end,
}

return {
  nvim_spectre, -- search/replace in multiple files
  flash, -- move faster in a file
  telescope, -- find files, grep text, file browser.. etc
}
