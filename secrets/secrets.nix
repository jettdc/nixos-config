let
  # New hosts should be added here
  mothershipPubKey = "age1qrwshs9dl7h74ppv78u8tgkryr9pjhu88ptzxxff74rtuz3we5esez0t3y";
in
{
  "secrets.age".publicKeys = [ mothershipPubKey ];
}
