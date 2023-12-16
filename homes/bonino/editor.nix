{ config, pkgs, ... }:

{
    
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # File managing
          telescope-nvim
          nvim-tree-lua
          nvim-web-devicons
      # Editing
          undotree
          refactoring-nvim
      # LSP
          mason-lspconfig-nvim
          nvim-lspconfig
          lsp-zero-nvim
          copilot-lua
          mason-nvim
          luasnip
      # Autocomplete
          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-cmdline 
      # Others
          nvim-treesitter.withAllGrammars
          trouble-nvim 
          vim-fugitive
          rose-pine
    ];
  };
}
