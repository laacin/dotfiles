return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    typescript = {
      tsdk = "/usr/lib/node_modules/typescript/lib",
    },
  },
}
