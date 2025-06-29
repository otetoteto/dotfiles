{ ... }:
{
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
}
