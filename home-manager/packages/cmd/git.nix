{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;

    userName = "otetoteto";
    userEmail = "oteto2oteto@gmail.com";

    aliases = {
      br = "branch";
      ch = "checkout";
      co = "commit";
      comend = "commit --amend";
      sw = "switch";
      st = "status";
      pl = "pull";
      plc = "!git pull origin $(git br | grep '*' | head | sed -e 's/* //g')";
      ph = "push";
      fh = "fetch";
      rb = "rebase";
      undo = "reset --soft HEAD^";
      unstage = "restore --staged";
      phf = "push --force-with-lease --force-if-includes";
      lt = "log --pretty=format:'%Cgreen[%cd] %Cblue%h %Cred<%cn> %Creset%s' --date=short --decorate --graph --branches --tags --remotes";
      swl = "!git branch --format=\"%(refname:short)\" | fzf --preview '' | xargs git switch";
      rml = "!git branch --format=\"%(refname:short)\" | fzf --preview '' | xargs git branch -D";
    };

    ignores = [
      ".mywork/**/*"
    ];

    extraConfig = {
      core = {
        quotepath = false;
        pager = "delta";
        editor = "code --wait";
      };

      push = {
        default = "current";
        autoSetupRemote = true;
      };

      init = {
        defaultBranch = "main";
      };

      color = {
        ui = true;
      };

      interactive = {
        diffFilter = "delta --color-only";
      };

      delta = {
        navigate = true;
        light = false;
        side-by-side = true;
      };

      merge = {
        conflictStyle = "diff3";
      };

      diff = {
        colorMoved = "default";
      };
    };
  };
}
