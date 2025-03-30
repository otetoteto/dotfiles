{ ... }:
{
  programs.lsd = {
    enable = true;

    settings = {
      ignore-blobs = [
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
