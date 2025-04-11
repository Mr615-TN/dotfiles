return {
  "https://gitlab.com/itaranto/preview.nvim",
  version = "*",
  opts = {
    previewers_by_ft = {
      plantuml = {
        name = "plantuml_svg",
        renderer = { type = "command", opts = { cmd = { "feh" } } },
      },
    },
    previewers = {
      plantuml_svg = {
        args = { "-pipe", "-tsvg" },
      },
    },
    render_on_write = true,
  },
}
