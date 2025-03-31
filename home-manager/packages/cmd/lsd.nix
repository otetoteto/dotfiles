{ ... }:
{
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
}
