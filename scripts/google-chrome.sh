sudo sed -i '/^Exec=\/usr\/bin\/google-chrome-stable/ s/$/ --disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled/' /usr/share/applications/com.google.Chrome.desktop && sudo sed -i '/^Exec=\/usr\/bin\/google-chrome-stable/ s/$/ --disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled/' /usr/share/applications/google-chrome.desktop

