{ username, ... }:
{
  displayManager.autoLogin = {
    enable = true;
    user = "${username}";
  };
}
