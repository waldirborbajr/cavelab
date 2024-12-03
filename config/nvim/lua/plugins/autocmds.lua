return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        disable_autocomment = {
          {
            event = "User",
            desc = "no auto comment after pressing o",
            pattern = "*",
            command = "setlocal formatoptions-=cro",
          },
        },
      },
    },
  },
}
