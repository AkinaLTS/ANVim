return {
  'Abizrh/commit-ai.nvim',
  enabled = vim.g.enable_commit_ai == true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local secrets = require("config.secrets")
    require('commit-ai').setup {
      icons = false,
      language = "en",
      git_conventions = {
        docs = { icon = "📖", prefix = "docs", type = "Documentation changes" },
        fix = { icon = "🐛", prefix = "fix", type = "Bug fix" },
        feat = { icon = "✨", prefix = "feat", type = "New feature" },
        enhance = { icon = "⚡", prefix = "enhance", type = "Enhancement" },
        chore = { icon = "🧹", prefix = "chore", type = "Chore" },
        refactor = { icon = "⚠️", prefix = "refactor", type = "Breaking change" },
      },
      provider_options = {
        gemini = {
          model = 'gemini-2.0-flash',
          api_key = secrets.commit_ai_api_key_gemini or "",
          stream = false,
        },
      }
    }
  end,
}
