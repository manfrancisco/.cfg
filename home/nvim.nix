{ config, ... }:
{
  programs.nixvim = {
    enable = true;

    colorschemes.tokyonight.enable = true;

    globals.mapleader = " ";
    globals.maplocalleader = " ";

    options = {
      # Indent wrapped text.
      breakindent = true;
      colorcolumn = "100";
      # This is the default value. `:help cot` to see the available options.
      completeopt = "menu,preview";
      cursorline = true;
      # Use spaces instead of tabs.
      expandtab = true;
      hlsearch = false;
      # Case-insensitive search.
      ignorecase = true;
      number = true;
      shiftwidth = 4;
      # Don't hide the signcolumn when there are no signs to show.
      signcolumn = "yes";
      # Hide the mode indicator e.g. `-- INSERT --`
      showmode = false;
      # If `ignorecase` is on, switch to case-sensitive search if query includes a capital letter.
      smartcase = true;
      swapfile = false;
      tabstop = 4;
      # Wrap text to 100 characters.
      textwidth = 99;
      # Wait `timeoutlen` milliseconds for a mapped sequence to complete.
      timeout = true;
      timeoutlen = 300;
      undodir = "${config.xdg.configHome}/nvim/undodir";
      undofile = true;
      # Word wrap.
      wrap = true;
    };

    autoCmd = [
      # Set indent to two spaces for some filetypes
      {
        event = [ "Filetype" ];
        pattern = [
          "html"
          "javascript"
          "javascriptreact"
          "nix"
          "typescript"
          "typescriptreact"
        ];
        command = "setlocal ts=2 sw=2";
      }
    ];

    keymaps = let
      map = mode: key: action: { mode = mode; key = key; action = action; };
      nmap = key: action: map [ "n" ] key action;
      nvmap = key: action: map [ "n" "v" ] key action;
      imap = key: action: map [ "i" ] key action;
      desc = d: { options.desc = d; };
      silent = { options.silent = true; };
      expr = { options.expr = true; };
    in [
      # Unmap keys that aren't useful, or that we want to use for different things
      (nvmap "<Space>" "<Nop>" // silent)
      (nvmap "<Cr>" "<Nop>" // silent)
      (nvmap "s" "<Nop>" // silent)
      # Leave insert mode by pressing j and k simultaneously
      (imap "jk" "<Esc>")
      (imap "kj" "<Esc>")
      # Redo
      (nmap "R" "<C-r>")
      # Copy and paste
      (nvmap "<leader>y" "\"+y" // desc "Cop[y] to clipboard")
      (nvmap "<leader>p" "\"+p" // desc "[P]aste from clipboard")
      # Jump to start/end of line
      (nvmap "H" "0")
      (nvmap "L" "$")
      # Navigate up and down word wrapped text as if it were not word wrapped
      (nmap "k" "v:count == 0 ? 'gk' : 'k'" // silent // expr)
      (nmap "j" "v:count == 0 ? 'gj' : 'j'" // silent // expr)
      # Center cursor when jumping foward or back
      (nmap "<C-o>" "<C-o>zz")
      (nmap "<C-i>" "<C-i>zz")
    ];

    plugins = {
      autoclose.enable = true;
      comment-nvim.enable = true;
      fidget.enable = true;
      fugitive.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      intellitab.enable = true;
      lightline.enable = true;
      lualine.enable = true;
      luasnip.enable = true;

      lsp = {
        enable = true;
        servers = {
          lua-ls.enable = true;
          nil_ls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };
      };
      # lsp-format.enable = true;
      none-ls = {
        enable = true;
        # enableLspFormat = true;
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "buffer"; }
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
              function(fallback)
                  luasnip = require('luasnip')
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  else
                    fallback()
                  end
              end
            '';
            modes = [ "i" "s" ];
          };
          "<S-Tab>" = {
            action = ''
              function(fallback)
                  luasnip = require('luasnip')
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.jumpable() then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
              end
            '';
            modes = [ "i" "s" ];
          };
        };
      };
      oil.enable = true;
      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        keymaps = {
          "<leader><leader>" = {
            action = "find_files";
            desc = "Search files by name";
          };
          "ss" = {
            action = "live_grep";
            desc = "[S]earch by live grep";
          };
          "sb" = {
            action = "buffers";
            desc = "[S]earch open [B]uffers by file name";
          };
          "sh" = {
            action = "help_tags";
            desc = "[S]earch [H]elp";
          };
          "sw" = {
            action = "grep_string";
            desc = "[S]earch for [W]ord under cursor";
          };
          "sg" = {
            action = "buffers";
            desc = "[S]earch [G]it files";
          };
          "sr" = {
            action = "oldfiles";
            desc = "[S]earch [R]ecently opened files by name";
          };
        };
      };
      treesitter.enable = true;
      treesitter-context.enable = true;
      ts-autotag.enable = true;
      undotree.enable = true;
    };
  };
}
