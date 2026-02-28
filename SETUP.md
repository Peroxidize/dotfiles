# Setup
My Fedora Gnome setup

1. Install rpm fusion
```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

2. Install applications
```bash
sudo dnf copr enable scottames/ghostty && sudo dnf install google-chrome-stable discord easyeffects mpv qbittorrent steam lutris gsettings zsh neovim gnome-tweaks google-noto-fonts-all util-linux fzf zoxide keyd ghostty gcc make ripgrep fd-find unzip jetbrains-mono-nl-fonts npm pnpm
```

3. Install multimedia and hardware codecs
```bash
sudo dnf swap ffmpeg-free ffmpeg --allowerasing && sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin && sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
```

4. Install gnome extension-manager and download the following extensions:
- AppIndicator and Kstatus
- Blur my Shell
- Disable Workspace Animation
- Just Perfection
- Space Bar
- Switcher
- Tactile
- Wallpaper Slideshow
- Speedinator
- Picture in Picture

5. Load dconf settings
```bash
dconf load / < dconf-settings.ini
```

6. Update grub settings
```
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT="amdgpu.abmlevel=0"
```

### Miscellaneous
- Anki addons
```
2055492159 569864517 759844606 1610304449 876946123 1771074083 1046608507 1045800357
```
