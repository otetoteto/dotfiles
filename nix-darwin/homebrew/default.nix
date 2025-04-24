{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    brews = [ ];

    casks = [
      "alt-tab"
      "claude"
      "deepl"
      "orbstack"
    ];

    masApps = {
      Kindle = 302584613;
      RunCat = 1429033973;
    };
  };
}
