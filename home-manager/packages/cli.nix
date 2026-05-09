{ pkgs, ... }:
{
	home.packages = with pkgs; [
    aws-vault
		cf-terraforming
		deno
		ghq
		delta
		kind
		kubectl
		lazydocker
		rustup
  ];

  programs.awscli = {
    enable = true;
  };

	programs.bat = {
    enable = true;

    config = {
      theme = "TwoDark";
    };
  };

	programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

	programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
      editor = "code --wait";
      prompt = "enabled";
    };
  };

	programs.git = {
    enable = true;

    settings = {
      user = {
        name = "otetoteto";
        email = "oteto2oteto@gmail.com";
      };

      alias = {
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
        wt = "worktree";
        undo = "reset --soft HEAD^";
        unstg = "restore --staged";
        phf = "push --force-with-lease --force-if-includes";
        lt = "log --pretty=format:'%Cgreen[%cd] %Cblue%h %Cred<%cn> %Creset%s' --date=short --decorate --graph --branches --tags --remotes";
        swl = "!git branch --format=\"%(refname:short)\" | fzf --multi --preview '' | xargs git switch";
        rml = "!git branch --format=\"%(refname:short)\" | fzf --multi --preview '' | xargs git branch -D";
        adl = "!comm -23 <(git status --short -uall | awk '{print $2}' | sort) <(git diff --cached --name-only | sort) | fzf --multi --preview '([[ -z \"$(git diff {-1})\" ]] && bat --style=numbers --color=always --line-range=:500 {-1} || git diff {-1}) | delta --width=$FZF_PREVIEW_COLUMNS' | awk '{print $NF}' | xargs git add";
        unstgl = "!git diff --cached --name-only | fzf --multi --preview 'git diff --cached {} | delta --width=$FZF_PREVIEW_COLUMNS' | xargs git unstg";
        alias = "!git config --get-regexp ^alias | sed -e 's/^alias\.//g' | awk '{print $1}' | fzf --preview 'git config --get-regexp ^alias.{}$ | sed -e 's/alias.{}//g' | sed -e \"s/!git/git/g\"' | sh -c 'git $(cat)'";
      };

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

    ignores = [
      ".mywork/**/*"
    ];
  };

	programs.go = {
    enable = true;
  };

	programs.jq = {
    enable = true;
  };

	programs.lsd = {
    enable = true;

    settings = {
      ignore-globs = [
        ".git"
        "node_modules"
        ".venv"
        "dist"
        "out"
        ".next"
      ];
    };
  };

	programs.mise = {
    enable = true;

    enableZshIntegration = true;

    globalConfig = {
      tools = {
        node = "lts";
        "npm:@anthropic-ai/claude-code" = "latest";
        "npm:@google/gemini-cli" = "latest";
      };
    };
  };

	programs.ripgrep = {
    enable = true;
  };

  programs.ripgrep-all = {
    enable = true;
  };

	programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
  };
}