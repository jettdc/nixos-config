# jett's nixos-config
Nix configuration for my homelab server

## Secrets

Note that the secrets dir is just templates, and actual secret files should be kept in `/etc/nix/secrets`. To add secrets:
- Create non-template versions of the nix files in `secrets`
- Run the `./copy_secrets.sh` script from the project root
