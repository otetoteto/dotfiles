{ username, ... }:
{
  homebrew = {
    enable = true;
    user = username;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    taps = [
      "dagger/tap"
    ];

    brews = [];

    casks = [
      "alt-tab"
      "claude"
      "deepl"
      "displaylink"
      "orbstack"
      "raycast"
      "1password"
      "dagger/tap/container-use"
    ];

    masApps = {
      Kindle = 302584613;
      RunCat = 1429033973;
    };
  };
}
