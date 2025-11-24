 # my .bashrc 

This repo contains my terminal configuration and setup scripts 

# before installing
Make sure you have the necesary pkgs: 
```
apt install exa fzf fd-find bat zoxide bc -y 
```

# installation 
```bash 
git clone https://github.com/piranhap/dotfiles
cd dotfiles
chmod +x install sh # in case is not executable 
/.install.sh 
```

This should do it. 
The script does: 

- backup existing config files
- symlink files 
- install cli tools 
- load the custom prompt 

