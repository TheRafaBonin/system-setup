{ config, pkgs, ... }:

{
    
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      undotree
      trouble-nvim 
      nvim-treesitter.withAllGrammars
      nvim-tree-lua
      nvim-web-devicons
      lsp-zero-nvim
      mason-nvim
      mason-lspconfig-nvim
      vim-fugitive
      nvim-cmp
      cmp-nvim-lsp
      rose-pine
      copilot-lua
      refactoring-nvim
    ];
  };
}
