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
      # Language and AutoComplete
          mason-lspconfig-nvim
          lsp-zero-nvim
          cmp-nvim-lsp
          copilot-lua
          mason-nvim
          nvim-cmp
      # Others
          nvim-treesitter.withAllGrammars
          trouble-nvim 
          vim-fugitive
          rose-pine
    ];
  };
}
