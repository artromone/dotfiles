return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "tune_claude",
      auto_suggestions_provider = "tune_claude",

      vendors = {
        ["tune_deepseek_v3"] = {
          api_key_name = "PROXYTUNE_API_KEY",
          endpoint = "https://proxy.tune.app",
          model = "deepseek/deepseek-v3",
          max_tokens = 4096,
          -- temperature = 0.6,
          __inherited_from = "openai",
        },
        ["tune_claude"] = {
          api_key_name = "PROXYTUNE_API_KEY",
          endpoint = "https://proxy.tune.app",
          model = "anthropic/claude-3.5-haiku",
          -- temperature = 0.6,
          max_tokens = 4096,
          __inherited_from = "openai",
        },
        ["tune_deepseek_r1"] = {
          api_key_name = "PROXYTUNE_API_KEY",
          endpoint = "https://proxy.tune.app",
          model = "deepseek/deepseek-r1",
          -- temperature = 0.6,
          max_tokens = 4096,
          __inherited_from = "openai",
        },
      },
      dual_boost = {
        enabled = false,
        first_provider = "tune_deepseek_v3",
        second_provider = "tune_deepseek_r1",
        prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000, -- Timeout in milliseconds
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
