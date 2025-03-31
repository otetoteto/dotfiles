{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    brews = [
      "poppler"
    ];

    casks = [
      "alt-tab"
      "claude"
      "deepl"
      "displaylink"
      "orbstack"
    ];

    masApps = {
      Kindle = 302584613;
      RunCat = 1429033973;
    };
  };
}
