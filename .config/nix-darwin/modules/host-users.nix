{ ... }:

let
  hostname = "Maltes-MacBook-Pro.local";
  username = "malteherrmann";
in {
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };
}
