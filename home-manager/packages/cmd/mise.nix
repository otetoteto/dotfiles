{ ... }:
{
  programs.mise = {
    enable = true;

    enableZshIntegration = true;

    globalConfig = {
      tools = {
        node = "lts";
        "npm:@anthropic-ai/claude-code" = "latest";
      };
    };
  };
}
