{ ... }:
{
  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
      editor = "code --wait";
      prompt = "enabled";
    };
  };
}
