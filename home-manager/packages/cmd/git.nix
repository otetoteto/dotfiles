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
      st = "status --short";
      pl = "pull";
      plc = "!git pull origin $(git rev-parse --abbrev-ref @)";
      ph = "push";
      fh = "fetch";
      rb = "rebase";
      undo = "reset --soft HEAD^";
      unstg = "restore --staged";
      phf = "push --force-with-lease --force-if-includes";
      lt = "log --pretty=format:'%Cgreen[%cd] %Cblue%h %Cred<%cn> %Creset%s' --date=short --decorate --graph --branches --tags --remotes";
      swl = "!git branch --format=\"%(refname:short)\" | fzf --multi --preview '' | xargs git switch";
      rml = "!git branch --format=\"%(refname:short)\" | fzf --multi --preview '' | xargs git branch -D";
      adl = "!git status --short -uall | fzf --multi --preview '([[ -z \"$(git diff {-1})\" ]] && bat --style=numbers --color=always --line-range=:500 {-1} || git diff {-1}) | delta --width=$FZF_PREVIEW_COLUMNS' | awk '{print $NF}' | xargs git add";
      unstgl = "!git diff --cached --name-only | fzf --multi --preview 'git diff --cached {} | delta --width=$FZF_PREVIEW_COLUMNS' | xargs git unstage";
      alias = "!git config --get-regexp ^alias | sed -e 's/^alias\.//g' | awk '{print $1}' | fzf --preview 'git config --get-regexp ^alias.{}$ | sed -e 's/alias.{}//g' | sed -e \"s/!git/git/g\"' | sh -c 'git $(cat)'";
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
