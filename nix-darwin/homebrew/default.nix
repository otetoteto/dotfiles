{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    casks = [
      "alt-tab"
      "claude"
      "deepl"
      "displaylink"
      "ghostty"
      "orbstack"
    ];

    masApps = {
      Kindle = 302584613;
      RunCat = 1429033973;
    };
  };
}
