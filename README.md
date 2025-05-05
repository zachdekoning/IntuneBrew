<h1 align="center">🍺 IntuneBrew</h1>

<div align="center">
  <p>
    <a href="https://twitter.com/UgurKocDe">
      <img src="https://img.shields.io/badge/Follow-@UgurKocDe-1DA1F2?style=flat&logo=x&logoColor=white" alt="Twitter Follow"/>
    </a>
    <a href="https://www.linkedin.com/in/ugurkocde/">
      <img src="https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin" alt="LinkedIn"/>
    </a>
    <img src="https://img.shields.io/github/license/ugurkocde/IntuneAssignmentChecker?style=flat" alt="License"/>
  </p>
  <p>
  <p>
    <a href="https://www.powershellgallery.com/packages/IntuneBrew">
      <img src="https://img.shields.io/powershellgallery/v/IntuneBrew?style=flat&label=PSGallery%20Version" alt="PowerShell Gallery Version"/>
    </a>
    <a href="https://www.powershellgallery.com/packages/IntuneBrew">
      <img src="https://img.shields.io/powershellgallery/dt/IntuneBrew?style=flat&label=PSGallery%20Downloads&color=brightgreen" alt="PowerShell Gallery Downloads"/>
    </a>
                                                                                                                                                                                                                                                                            <p>
    <a href="#-supported-applications">
      <img src="https://img.shields.io/badge/Apps_Available-501-2ea44f?style=flat" alt="TotalApps"/>
    </a>
  </p>
</div>

IntuneBrew is a PowerShell-based tool that simplifies the process of uploading and managing macOS applications in Microsoft Intune. It automates the entire workflow—from downloading apps to uploading them to Intune with proper metadata and icons.

This project uses publicly available metadata from Homebrew’s JSON API. Homebrew is a registered trademark of its respective owners and is not affiliated with or endorsing this project.

## Watch the full walkthrough of the tool:

<div align="center">
      <a href="https://www.youtube.com/watch?v=7NEs-EnvmII">
     <img 
      src="https://img.youtube.com/vi/7NEs-EnvmII/maxresdefault.jpg" 
      alt="IntuneBrew" 
      style="width:100%;">
      </a>
</div>

## Table of Contents

- [Watch the full walkthrough of the tool:](#watch-the-full-walkthrough-of-the-tool)
- [Table of Contents](#table-of-contents)
- [🚨 Public Preview Notice](#-public-preview-notice)
- [🔄 Latest Updates](#-latest-updates)
- [✨ Features](#-features)
- [🚀 Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
- [📝 Usage](#-usage)
  - [Basic Usage](#basic-usage)
  - [📱 Supported Applications](#-supported-applications)
- [🔧 Configuration](#-configuration)
  - [Using System Managed Identity](#using-system-managed-identity)
  - [Using User Assigned Managed Identity](#using-user-assigned-managed-identity)
  - [Using ClientSecret from Entra ID App Registration](#using-clientsecret-from-entra-id-app-registration)
  - [Certificate-Based Authentication](#certificate-based-authentication)
  - [Copy Assignments](#copy-assignments)
  - [App JSON Structure](#app-json-structure)
- [🔄 Version Management](#-version-management)
- [🛠️ Error Handling](#️-error-handling)
- [🤔 Troubleshooting](#-troubleshooting)
  - [Common Issues](#common-issues)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)
- [📞 Support](#-support)

## 🚨 Public Preview Notice

> [!IMPORTANT]
> 🚧 **Public Preview Notice**
>
> IntuneBrew is currently in Public Preview. While it's fully functional, you might encounter some rough edges. Your feedback and contributions are crucial in making this tool better!
>
> - 📝 [Submit Feedback](https://github.com/ugurkocde/IntuneBrew/issues/new?labels=feedback)
> - 🐛 [Report Bugs](https://github.com/ugurkocde/IntuneBrew/issues/new?labels=bug)
> - 💡 [Request Features](https://github.com/ugurkocde/IntuneBrew/issues/new?labels=enhancement)
>
> Thank you for being an early adopter! 🙏


## 🔄 Latest Updates

*Last checked: 2025-05-05 16:24 UTC*

> All applications are up to date! 🎉
## ✨ Features

- 🚀 Automated app uploads to Microsoft Intune
- 📦 Supports both .dmg and .pkg files
- 🔄 Automatic version checking and updates
- 🖼️ Automatic app icon integration
- 📊 Progress tracking for large file uploads
- 🔐 Secure authentication with Microsoft Graph API
- 🎯 Smart duplicate detection
- 💫 Bulk upload support
- 🔁 Automatic retry mechanism for failed uploads
- 🔒 Secure file encryption for uploads
- 📈 Real-time progress monitoring

## 🚀 Getting Started

### Prerequisites

- PowerShell 7.0 or higher
- Administrator rights (script must be installed as administrator, specially if you use "Install-Script IntuneBrew -Force")
- Microsoft.Graph.Authentication Module must be installed
- Azure App Registration with appropriate permissions OR Manual Connection via Interactive Sign-In
- Windows or macOS operating system

## 📝 Usage

### Basic Usage

Download the script: IntuneBrew.ps1

Run the script:

```powershell
.\IntuneBrew.ps1
```

Follow the interactive prompts to:

1. Select which apps to upload
2. Authenticate with Microsoft Graph
3. Monitor the upload progress
4. View the results in Intune

### 📱 Supported Applications

| Application | Latest Version |
|-------------|----------------|
| <img src='Logos/1password.png' width='32' height='32'> 1Password | 8.10.75 |
| ❌ A Better Finder Rename | 12.12 |
| ❌ Abstract | 98.6.0 |
| <img src='Logos/acorn.png' width='32' height='32'> Acorn | 8.1.1 |
| ❌ Acronis True Image | 29.2 |
| <img src='Logos/adguard.png' width='32' height='32'> AdGuard | 2.16.4.1870 |
| <img src='Logos/adobe_acrobat_pro_dc.png' width='32' height='32'> Adobe Acrobat Pro DC | 25.001.20476 |
| <img src='Logos/adobe_acrobat_reader.png' width='32' height='32'> Adobe Acrobat Reader | 25.001.20467 |
| <img src='Logos/adobe_creative_cloud.png' width='32' height='32'> Adobe Creative Cloud | 6.6.0.611 |
| ❌ Advanced Renamer | 4.11 |
| ❌ AirBuddy | 2.7.3 |
| ❌ Aircall | 3.1.66 |
| <img src='Logos/airfoil.png' width='32' height='32'> Airfoil | 5.12.4 |
| ❌ AirParrot | 3.1.7 |
| <img src='Logos/airtable.png' width='32' height='32'> Airtable | 1.6.6 |
| <img src='Logos/airy.png' width='32' height='32'> Airy | 3.29.2 |
| <img src='Logos/alacritty.png' width='32' height='32'> Alacritty | 0.15.1 |
| ❌ Alcove | 1.2.5 |
| <img src='Logos/alfred.png' width='32' height='32'> Alfred | 5.6 |
| <img src='Logos/alttab.png' width='32' height='32'> AltTab | 7.24.0 |
| <img src='Logos/amadine.png' width='32' height='32'> Amadine | 1.6.7 |
| <img src='Logos/amazon_chime.png' width='32' height='32'> Amazon Chime | 5.23.22318 |
| <img src='Logos/amazon_q.png' width='32' height='32'> Amazon Q | 1.9.1 |
| <img src='Logos/android_studio.png' width='32' height='32'> Android Studio | 2024.3.1.15 |
| <img src='Logos/angry_ip_scanner.png' width='32' height='32'> Angry IP Scanner | 3.9.1 |
| <img src='Logos/anki.png' width='32' height='32'> Anki | 25.02.4 |
| ❌ Antinote | 1.1.5 |
| <img src='Logos/anydo.png' width='32' height='32'> Any.do | 5.0.68 |
| <img src='Logos/anydesk.png' width='32' height='32'> AnyDesk | 9.0.2 |
| <img src='Logos/apidog.png' width='32' height='32'> Apidog | 2.7.8 |
| <img src='Logos/apifox.png' width='32' height='32'> Apifox | 2.7.8 |
| <img src='Logos/apparency.png' width='32' height='32'> Apparency | 2.2 |
| <img src='Logos/arc.png' width='32' height='32'> Arc | 1.91.2 |
| ❌ Archaeology | 1.2 |
| <img src='Logos/arduino_ide.png' width='32' height='32'> Arduino IDE | 2.3.6 |
| <img src='Logos/asana.png' width='32' height='32'> Asana | 2.4.0 |
| ❌ Asset Catalog Tinkerer | 2.9 |
| <img src='Logos/audacity.png' width='32' height='32'> Audacity | 3.7.3 |
| <img src='Logos/audio_hijack.png' width='32' height='32'> Audio Hijack | 4.5.0 |
| <img src='Logos/autodesk_fusion_360.png' width='32' height='32'> Autodesk Fusion 360 | latest |
| ❌ AWS Client VPN | 5.2.0 |
| <img src='Logos/aws_corretto_jdk.png' width='32' height='32'> AWS Corretto JDK | 21.0.7.6.1 |
| <img src='Logos/azul_zulu_java_standard_edition_development_kit.png' width='32' height='32'> Azul Zulu Java Standard Edition Development Kit | 24.0.1 |
| <img src='Logos/azure_data_studio.png' width='32' height='32'> Azure Data Studio | 1.51.1 |
| <img src='Logos/background_music.png' width='32' height='32'> Background Music | 0.4.3 |
| <img src='Logos/badgeify.png' width='32' height='32'> Badgeify | 1.6.1 |
| <img src='Logos/bambu_studio.png' width='32' height='32'> Bambu Studio | 02.00.03.54 |
| <img src='Logos/bartender.png' width='32' height='32'> Bartender | 5.3.5 |
| <img src='Logos/basecamp.png' width='32' height='32'> Basecamp | 3 |
| ❌ BatFi | 2.4.1 |
| <img src='Logos/bbedit.png' width='32' height='32'> BBEdit | 15.1.4 |
| <img src='Logos/beeper.png' width='32' height='32'> Beeper | 4.0.661 |
| <img src='Logos/betterdisplay.png' width='32' height='32'> BetterDisplay | 3.5.5 |
| <img src='Logos/bettermouse.png' width='32' height='32'> BetterMouse | 1.6 |
| <img src='Logos/bettertouchtool.png' width='32' height='32'> BetterTouchTool | 5.356 |
| <img src='Logos/betterzip.png' width='32' height='32'> BetterZip | 5.3.4 |
| <img src='Logos/beyond_compare.png' width='32' height='32'> Beyond Compare | 5.0.7.30840 |
| ❌ Binary Ninja | 5.0.7290 |
| <img src='Logos/bitwarden.png' width='32' height='32'> Bitwarden | 2025.4.2 |
| ❌ Bitwig Studio | 5.3.8 |
| <img src='Logos/blender.png' width='32' height='32'> Blender | 4.4.3 |
| ❌ BLEUnlock | 1.12.2 |
| <img src='Logos/blip.png' width='32' height='32'> blip | 1.1.7 |
| <img src='Logos/blizzard_battlenet.png' width='32' height='32'> Blizzard Battle.net | 1.18.10.3141 |
| ❌ BlurScreen | 1.0 |
| <img src='Logos/boltai.png' width='32' height='32'> BoltAI | 1.35.2 |
| ❌ Bome Network | 1.6.0 |
| <img src='Logos/boop.png' width='32' height='32'> Boop | 1.4.0 |
| <img src='Logos/boxcryptor.png' width='32' height='32'> Boxcryptor | 3.13.680 |
| <img src='Logos/brave.png' width='32' height='32'> Brave | 1.78.94.0 |
| <img src='Logos/breaktimer.png' width='32' height='32'> BreakTimer | 1.3.2 |
| <img src='Logos/bruno.png' width='32' height='32'> Bruno | 2.2.0 |
| <img src='Logos/busycal.png' width='32' height='32'> BusyCal | 2025.2.1 |
| <img src='Logos/busycontacts.png' width='32' height='32'> BusyContacts | 2025.2.1 |
| <img src='Logos/caffeine.png' width='32' height='32'> Caffeine | 1.5.1 |
| <img src='Logos/calibre.png' width='32' height='32'> calibre | 8.3.0 |
| <img src='Logos/calmly_writer.png' width='32' height='32'> Calmly Writer | 2.0.59 |
| <img src='Logos/camtasia.png' width='32' height='32'> Camtasia | 25.1.0 |
| <img src='Logos/canva.png' width='32' height='32'> Canva | 1.107.0 |
| <img src='Logos/capcut.png' width='32' height='32'> CapCut | 3.3.0.1159 |
| <img src='Logos/chatgpt.png' width='32' height='32'> ChatGPT | 1.2025.112 |
| <img src='Logos/chatwise.png' width='32' height='32'> ChatWise | 0.8.47 |
| <img src='Logos/chrome_remote_desktop.png' width='32' height='32'> Chrome Remote Desktop | 136.0.7103.19 |
| <img src='Logos/cisco_jabber.png' width='32' height='32'> Cisco Jabber | 20250430033337 |
| <img src='Logos/citrix_workspace.png' width='32' height='32'> Citrix Workspace | 25.03.0.95 |
| <img src='Logos/claude.png' width='32' height='32'> Claude | 0.9.3 |
| <img src='Logos/cleanmymac.png' width='32' height='32'> CleanMyMac | 5.0.8 |
| <img src='Logos/cleanshot.png' width='32' height='32'> CleanShot | 4.7.6 |
| <img src='Logos/clion.png' width='32' height='32'> CLion | 2025.1 |
| <img src='Logos/clipy.png' width='32' height='32'> Clipy | 1.2.1 |
| ❌ Clop | 2.9.2 |
| <img src='Logos/cloudflare_warp.png' width='32' height='32'> Cloudflare WARP | 2025.2.664.0 |
| <img src='Logos/codeedit.png' width='32' height='32'> CodeEdit | 0.3.4 |
| <img src='Logos/coderunner.png' width='32' height='32'> CodeRunner | 4.4.1 |
| <img src='Logos/company_portal.png' width='32' height='32'> Company Portal | 5.2502.1 |
| <img src='Logos/copilot_for_xcode.png' width='32' height='32'> Copilot for Xcode | 0.35.7 |
| ❌ CopyClip | 2.9.99.2 |
| <img src='Logos/copyq.png' width='32' height='32'> CopyQ | 10.0.0 |
| <img src='Logos/coteditor.png' width='32' height='32'> CotEditor | 5.1.6 |
| <img src='Logos/cryptomator.png' width='32' height='32'> Cryptomator | 1.15.2 |
| <img src='Logos/crystalfetch.png' width='32' height='32'> Crystalfetch | 2.2.0 |
| <img src='Logos/cursor.png' width='32' height='32'> Cursor | 0.49.6 |
| <img src='Logos/cyberduck.png' width='32' height='32'> Cyberduck | 9.1.4 |
| <img src='Logos/daisydisk.png' width='32' height='32'> DaisyDisk | 4.31 |
| <img src='Logos/dangerzone.png' width='32' height='32'> Dangerzone | 0.9.0 |
| <img src='Logos/dataflare.png' width='32' height='32'> Dataflare | 1.9.5 |
| <img src='Logos/datagrip.png' width='32' height='32'> DataGrip | 2025.1.1 |
| <img src='Logos/dataspell.png' width='32' height='32'> DataSpell | 2025.1 |
| <img src='Logos/db_browser_for_sqlite.png' width='32' height='32'> DB Browser for SQLite | 3.13.1 |
| <img src='Logos/dbeaver_community_edition.png' width='32' height='32'> DBeaver Community Edition | 25.0.4 |
| <img src='Logos/dbgate.png' width='32' height='32'> DbGate | 6.4.1 |
| <img src='Logos/deepl.png' width='32' height='32'> DeepL | 25.4.11926442 |
| ❌ DeskPad | 1.3.2 |
| <img src='Logos/devtoys.png' width='32' height='32'> DevToys | 2.0.8.0 |
| <img src='Logos/devutils.png' width='32' height='32'> DevUtils | 1.17.0 |
| <img src='Logos/discord.png' width='32' height='32'> Discord | 0.0.344 |
| <img src='Logos/displaylink_usb_graphics_software.png' width='32' height='32'> DisplayLink USB Graphics Software | 1.12.1 |
| <img src='Logos/dockdoor.png' width='32' height='32'> DockDoor | 1.7.1 |
| <img src='Logos/docker_desktop.png' width='32' height='32'> Docker Desktop | 4.41.1 |
| ❌ Dockside | 1.9.54 |
| <img src='Logos/dosbox.png' width='32' height='32'> DOSBox | 0.74-3 |
| <img src='Logos/doughnut.png' width='32' height='32'> Doughnut | 2.0.1 |
| <img src='Logos/downie.png' width='32' height='32'> Downie | 4.9.15 |
| <img src='Logos/drawio_desktop.png' width='32' height='32'> draw.io Desktop | 26.2.15 |
| <img src='Logos/drawbot.png' width='32' height='32'> DrawBot | 3.132 |
| <img src='Logos/drivedx.png' width='32' height='32'> DriveDX | 1.12.1 |
| <img src='Logos/dropbox.png' width='32' height='32'> Dropbox | 223.4.4909 |
| <img src='Logos/dropdmg.png' width='32' height='32'> DropDMG | 3.6.8 |
| <img src='Logos/dropshare.png' width='32' height='32'> Dropshare | 6.3 |
| <img src='Logos/duckduckgo.png' width='32' height='32'> DuckDuckGo | 1.137.0 |
| <img src='Logos/easydict.png' width='32' height='32'> Easydict | 2.14.1 |
| <img src='Logos/easyfind.png' width='32' height='32'> EasyFind | 5.0.2 |
| <img src='Logos/eclipse_temurin_java_development_kit.png' width='32' height='32'> Eclipse Temurin Java Development Kit | 24.0.1 |
| ❌ EdrawMax | 12.6.1 |
| <img src='Logos/elephas.png' width='32' height='32'> Elephas | 11.1086 |
| <img src='Logos/elgato_camera_hub.png' width='32' height='32'> Elgato Camera Hub | 2.0.0.5750 |
| ❌ Elgato Capture Device Utility | 1.3.1 |
| <img src='Logos/elgato_stream_deck.png' width='32' height='32'> Elgato Stream Deck | 6.8.1.21263 |
| <img src='Logos/elgato_wave_link.png' width='32' height='32'> Elgato Wave Link | 2.0.6.3780 |
| ❌ Ente | 1.7.12 |
| ❌ Ente Auth | 4.3.5 |
| <img src='Logos/epic_games_launcher.png' width='32' height='32'> Epic Games Launcher | 18.5.0 |
| <img src='Logos/espanso.png' width='32' height='32'> Espanso | 2.2.1 |
| <img src='Logos/etcher.png' width='32' height='32'> Etcher | 2.1.0 |
| <img src='Logos/evernote.png' width='32' height='32'> Evernote | 10.105.4 |
| <img src='Logos/flux.png' width='32' height='32'> f.lux | 42.2 |
| <img src='Logos/facebook_messenger.png' width='32' height='32'> Facebook Messenger | 233.1.0.8.208 |
| <img src='Logos/fantastical.png' width='32' height='32'> Fantastical | 4.0.11 |
| ❌ Fathom | 1.39.0 |
| <img src='Logos/figma.png' width='32' height='32'> Figma | 125.4.7 |
| <img src='Logos/fission.png' width='32' height='32'> Fission | 2.8.8 |
| <img src='Logos/flameshot.png' width='32' height='32'> Flameshot | 12.1.0 |
| ❌ FlowVision | 1.6.2 |
| <img src='Logos/flycut.png' width='32' height='32'> Flycut | 1.9.6 |
| ❌ Forecast | 0.9.6 |
| <img src='Logos/foxit_pdf_editor.png' width='32' height='32'> Foxit PDF Editor | 13.1.7 |
| <img src='Logos/freecad.png' width='32' height='32'> FreeCAD | 1.0.0 |
| <img src='Logos/freelens.png' width='32' height='32'> Freelens | 1.2.1 |
| <img src='Logos/freemacsoft_appcleaner.png' width='32' height='32'> FreeMacSoft AppCleaner | 3.6.8 |
| <img src='Logos/freetube.png' width='32' height='32'> FreeTube | 0.23.5 |
| <img src='Logos/fsmonitor.png' width='32' height='32'> FSMonitor | 1.2 |
| ❌ Gather Town | 1.31.0 |
| <img src='Logos/geany.png' width='32' height='32'> Geany | 2.0 |
| <img src='Logos/geekbench.png' width='32' height='32'> Geekbench | 6.4.0 |
| <img src='Logos/geekbench_ai.png' width='32' height='32'> Geekbench AI | 1.3.0 |
| <img src='Logos/gemini.png' width='32' height='32'> Gemini | 2.9.11 |
| ❌ Gephi | 0.10.1 |
| <img src='Logos/ghostty.png' width='32' height='32'> Ghostty | 1.1.3 |
| <img src='Logos/gifox.png' width='32' height='32'> gifox | 2.6.5+0 |
| <img src='Logos/gimp.png' width='32' height='32'> GIMP | 3.0.2 |
| <img src='Logos/git_credential_manager.png' width='32' height='32'> Git Credential Manager | 2.6.1 |
| <img src='Logos/gitfinder.png' width='32' height='32'> GitFinder | 1.7.11 |
| <img src='Logos/github_desktop.png' width='32' height='32'> GitHub Desktop | 3.4.19-d147b1a3 |
| <img src='Logos/gitkraken.png' width='32' height='32'> GitKraken | 11.0.0 |
| <img src='Logos/godot_engine.png' width='32' height='32'> Godot Engine | 4.4.1 |
| ❌ Godspeed | 1.8.92 |
| <img src='Logos/goland.png' width='32' height='32'> Goland | 2025.1 |
| <img src='Logos/google_ads_editor.png' width='32' height='32'> Google Ads Editor | 2.9 |
| <img src='Logos/google_chrome.png' width='32' height='32'> Google Chrome | 136.0.7103.49 |
| <img src='Logos/google_drive.png' width='32' height='32'> Google Drive | 107.0.3 |
| <img src='Logos/goose.png' width='32' height='32'> Goose | 1.0.21 |
| <img src='Logos/gpt_fdisk.png' width='32' height='32'> GPT fdisk | 1.0.10 |
| <img src='Logos/grammarly_desktop.png' width='32' height='32'> Grammarly Desktop | 1.116.1.0 |
| <img src='Logos/grandperspective.png' width='32' height='32'> GrandPerspective | 3.5.2 |
| <img src='Logos/hammerspoon.png' width='32' height='32'> Hammerspoon | 1.0.0 |
| <img src='Logos/hazel.png' width='32' height='32'> Hazel | 6.0.4 |
| <img src='Logos/hazeover.png' width='32' height='32'> HazeOver | 1.9.4 |
| <img src='Logos/headlamp.png' width='32' height='32'> Headlamp | 0.30.0 |
| ❌ HEY | 1.2.17 |
| <img src='Logos/hidden_bar.png' width='32' height='32'> Hidden Bar | 1.9 |
| ❌ Highlight | 1.1.51 |
| <img src='Logos/home_assistant.png' width='32' height='32'> Home Assistant | 2025.3 |
| <img src='Logos/homerow.png' width='32' height='32'> Homerow | 1.4.0 |
| <img src='Logos/hp_easy_admin.png' width='32' height='32'> HP Easy Admin | 2.15.0 |
| ❌ HuggingChat | 0.7.0 |
| ❌ Huly | 0.6.499 |
| <img src='Logos/hyper.png' width='32' height='32'> Hyper | 3.4.1 |
| ❌ Hyperkey | 0.47 |
| <img src='Logos/ice.png' width='32' height='32'> Ice | 0.11.12 |
| <img src='Logos/iina.png' width='32' height='32'> IINA | 1.3.5 |
| <img src='Logos/imazing.png' width='32' height='32'> iMazing | 3.1.2 |
| <img src='Logos/imazing_profile_editor.png' width='32' height='32'> iMazing Profile Editor | 1.9.2 |
| <img src='Logos/inkscape.png' width='32' height='32'> Inkscape | 1.4.028868 |
| <img src='Logos/insomnia.png' width='32' height='32'> Insomnia | 11.0.2 |
| <img src='Logos/insta360_studio.png' width='32' height='32'> Insta360 Studio | 5.6.1 |
| <img src='Logos/intellij_idea_community_edition.png' width='32' height='32'> IntelliJ IDEA Community Edition | 2025.1 |
| ❌ IsThereNet | 1.7.1 |
| <img src='Logos/iterm2.png' width='32' height='32'> iTerm2 | 3.5.13 |
| <img src='Logos/itsycal.png' width='32' height='32'> Itsycal | 0.15.6 |
| <img src='Logos/jabra_direct.png' width='32' height='32'> Jabra Direct | 6.22.11401 |
| ❌ Jamie | 4.2.5 |
| <img src='Logos/jellyfin.png' width='32' height='32'> Jellyfin | 10.10.7 |
| <img src='Logos/jetbrains_phpstorm.png' width='32' height='32'> JetBrains PhpStorm | 2025.1.0.1 |
| <img src='Logos/jetbrains_pycharm_community_edition.png' width='32' height='32'> Jetbrains PyCharm Community Edition | 2025.1 |
| <img src='Logos/jetbrains_rider.png' width='32' height='32'> JetBrains Rider | 2025.1.1 |
| <img src='Logos/jetbrains_toolbox.png' width='32' height='32'> JetBrains Toolbox | 2.6.1 |
| <img src='Logos/joplin.png' width='32' height='32'> Joplin | 3.3.12 |
| <img src='Logos/jumpcut.png' width='32' height='32'> Jumpcut | 0.84 |
| <img src='Logos/jumpshare.png' width='32' height='32'> Jumpshare | 3.3.17 |
| <img src='Logos/kap.png' width='32' height='32'> Kap | 3.6.0 |
| <img src='Logos/karabiner_elements.png' width='32' height='32'> Karabiner Elements | 15.3.0 |
| <img src='Logos/keepassxc.png' width='32' height='32'> KeePassXC | 2.7.10 |
| <img src='Logos/keeper_password_manager.png' width='32' height='32'> Keeper Password Manager | 17.1.1 |
| <img src='Logos/keka.png' width='32' height='32'> Keka | 1.4.8 |
| <img src='Logos/keybase.png' width='32' height='32'> Keybase | 6.5.1 |
| <img src='Logos/keycastr.png' width='32' height='32'> KeyCastr | 0.10.3 |
| <img src='Logos/keyclu.png' width='32' height='32'> KeyClu | 0.30.1 |
| <img src='Logos/kitty.png' width='32' height='32'> kitty | 0.41.1 |
| <img src='Logos/klokki.png' width='32' height='32'> Klokki | 1.3.7 |
| <img src='Logos/krisp.png' width='32' height='32'> Krisp | 3.1.6 |
| <img src='Logos/krita.png' width='32' height='32'> Krita | 5.2.9 |
| <img src='Logos/langgraph_studio.png' width='32' height='32'> LangGraph Studio | 0.0.37 |
| ❌ Last Window Quits | 1.1.4 |
| <img src='Logos/lens.png' width='32' height='32'> Lens | 2025.4.92142 |
| <img src='Logos/libreoffice.png' width='32' height='32'> LibreOffice | 25.2.3 |
| <img src='Logos/librewolf.png' width='32' height='32'> LibreWolf | 138.0.1 |
| <img src='Logos/little_snitch.png' width='32' height='32'> Little Snitch | 6.2.3 |
| <img src='Logos/lm_studio.png' width='32' height='32'> LM Studio | 0.3.15 |
| <img src='Logos/logitech_g_hub.png' width='32' height='32'> Logitech G HUB | 2025.3.696161 |
| <img src='Logos/logitech_options.png' width='32' height='32'> Logitech Options+ | 1.89.705126 |
| <img src='Logos/lookaway.png' width='32' height='32'> LookAway | 1.12.1 |
| ❌ Loop | 1.2.0 |
| <img src='Logos/lulu.png' width='32' height='32'> LuLu | 3.1.5 |
| ❌ Lunatask | 2.0.22 |
| <img src='Logos/löve.png' width='32' height='32'> LÖVE | 11.5 |
| <img src='Logos/maccy.png' width='32' height='32'> Maccy | 2.3.0 |
| <img src='Logos/macdown.png' width='32' height='32'> MacDown | 0.7.2 |
| <img src='Logos/macfuse.png' width='32' height='32'> macFUSE | 4.10.2 |
| ❌ MacPass | 0.8.1 |
| <img src='Logos/macs_fan_control.png' width='32' height='32'> Macs Fan Control | 1.5.17 |
| <img src='Logos/mactex.png' width='32' height='32'> MacTeX | 2025.0308 |
| <img src='Logos/macwhisper.png' width='32' height='32'> MacWhisper | 12.7 |
| ❌ Maestral | 1.9.4 |
| ❌ MagicQuit | 1.4 |
| ❌ Malwarebytes for Mac | 5.13.4.2285 |
| ❌ MarkEdit | 1.22.1 |
| ❌ MarsEdit | 5.3.4 |
| <img src='Logos/marta_file_manager.png' width='32' height='32'> Marta File Manager | 0.8.2 |
| <img src='Logos/mattermost.png' width='32' height='32'> Mattermost | 5.11.2 |
| <img src='Logos/meetingbar.png' width='32' height='32'> MeetingBar | 4.10.0 |
| <img src='Logos/meld_for_macos.png' width='32' height='32'> Meld for macOS | 3.22.3+105 |
| <img src='Logos/menubar_stats.png' width='32' height='32'> MenuBar Stats | 3.9 |
| <img src='Logos/metasploit_framework.png' width='32' height='32'> Metasploit Framework | 6.4.54 |
| <img src='Logos/micro_snitch.png' width='32' height='32'> Micro Snitch | 1.6.1 |
| <img src='Logos/microsoft_auto_update.png' width='32' height='32'> Microsoft Auto Update | 4.79.25033028 |
| <img src='Logos/microsoft_azure_storage_explorer.png' width='32' height='32'> Microsoft Azure Storage Explorer | 1.38.0 |
| <img src='Logos/microsoft_edge.png' width='32' height='32'> Microsoft Edge | 136.0.3240.50 |
| <img src='Logos/microsoft_office.png' width='32' height='32'> Microsoft Office | 16.96.25041326 |
| <img src='Logos/microsoft_teams.png' width='32' height='32'> Microsoft Teams | 25079.2107.3576.1611 |
| <img src='Logos/microsoft_visual_studio_code.png' width='32' height='32'> Microsoft Visual Studio Code | 1.99.3 |
| ❌ Middle | 1.9 |
| ❌ Mindmanager | 24.1.155 |
| <img src='Logos/miro.png' width='32' height='32'> Miro | 0.10.96 |
| <img src='Logos/mist.png' width='32' height='32'> Mist | 0.20.1 |
| <img src='Logos/mitmproxy.png' width='32' height='32'> mitmproxy | 12.0.0 |
| ❌ Mixxx | 2.5.1 |
| ❌ Mobirise | 6.0.1 |
| <img src='Logos/mockoon.png' width='32' height='32'> Mockoon | 9.2.0 |
| <img src='Logos/mongodb_compass.png' width='32' height='32'> MongoDB Compass | 1.46.1 |
| <img src='Logos/monitorcontrol.png' width='32' height='32'> MonitorControl | 4.3.3 |
| <img src='Logos/moonlight.png' width='32' height='32'> Moonlight | 6.1.0 |
| <img src='Logos/mos.png' width='32' height='32'> Mos | 3.5.0 |
| <img src='Logos/motrix.png' width='32' height='32'> Motrix | 1.8.19 |
| <img src='Logos/mountain_duck.png' width='32' height='32'> Mountain Duck | 4.17.4 |
| <img src='Logos/mounty_for_ntfs.png' width='32' height='32'> Mounty for NTFS | 2.4 |
| <img src='Logos/mouseless.png' width='32' height='32'> mouseless | 0.3.1 |
| <img src='Logos/mozilla_firefox.png' width='32' height='32'> Mozilla Firefox | 138.0.1 |
| ❌ Mozilla Firefox Developer Edition | 139.0b3 |
| ❌ Mozilla Firefox ESR | 128.10.0 |
| ❌ Mozilla Thunderbird | 138.0 |
| ❌ Multi | 0.538.2 |
| ❌ MultiViewer for F1 | 1.43.2 |
| ❌ MURAL | 3.0.4 |
| ❌ Name Mangler | 3.9.3 |
| ❌ NeoFinder | 8.9 |
| <img src='Logos/netbeans_ide.png' width='32' height='32'> NetBeans IDE | 25 |
| ❌ Netiquette | 2.3.0 |
| <img src='Logos/netnewswire.png' width='32' height='32'> NetNewsWire | 6.1.9 |
| <img src='Logos/nextcloud.png' width='32' height='32'> Nextcloud | 3.16.4 |
| ❌ Nitro PDF Pro | 14.7 |
| <img src='Logos/nomachine.png' width='32' height='32'> NoMachine | 8.16.1 |
| ❌ NordLayer | 3.5.5 |
| ❌ NordLocker | 4.26.1 |
| ❌ NordPass | 6.0.19 |
| <img src='Logos/nordvpn.png' width='32' height='32'> NordVPN | 8.37.0 |
| ❌ NoSQL Workbench | 3.13.5 |
| <img src='Logos/nota_gyazo_gif.png' width='32' height='32'> Nota Gyazo GIF | 9.9.0 |
| ❌ NotesOllama | 0.2.6 |
| <img src='Logos/notion.png' width='32' height='32'> Notion | 4.10.0 |
| <img src='Logos/notion_calendar.png' width='32' height='32'> Notion Calendar | 1.130.0 |
| <img src='Logos/notunes.png' width='32' height='32'> noTunes | 3.5 |
| ❌ Noun Project | 2.3 |
| ❌ Novabench | 5.5.4 |
| <img src='Logos/nucleo.png' width='32' height='32'> Nucleo | 4.1.6 |
| ❌ Nudge | 2.0.12.81807 |
| <img src='Logos/nvidia_geforce_now.png' width='32' height='32'> NVIDIA GeForce NOW | 2.0.73.139 |
| <img src='Logos/obs.png' width='32' height='32'> OBS | 31.0.3 |
| <img src='Logos/obsidian.png' width='32' height='32'> Obsidian | 1.8.10 |
| ❌ Okta Advanced Server Access | 1.89.1 |
| <img src='Logos/ollama.png' width='32' height='32'> Ollama | 0.6.7 |
| ❌ OmniFocus | 4.5.3 |
| ❌ OmniOutliner | 5.14.3 |
| <img src='Logos/omnissa_horizon_client.png' width='32' height='32'> Omnissa Horizon Client | 2503-8.15.0-14236092062 |
| <img src='Logos/onedrive.png' width='32' height='32'> OneDrive | 25.051.0317.0003 |
| <img src='Logos/onyx.png' width='32' height='32'> OnyX | 4.6.2 |
| <img src='Logos/openvpn_connect_client.png' width='32' height='32'> OpenVPN Connect client | 3.7.1 |
| <img src='Logos/opera.png' width='32' height='32'> Opera | 118.0.5461.83 |
| <img src='Logos/oracle_virtualbox.png' width='32' height='32'> Oracle VirtualBox | 7.1.8 |
| <img src='Logos/orbstack.png' width='32' height='32'> OrbStack | 1.10.3 |
| <img src='Logos/orca_slicer.png' width='32' height='32'> Orca Slicer | 2.3.0 |
| ❌ Orka CLI | 2.4.0 |
| ❌ Orka Desktop | 3.0.0 |
| ❌ Overflow | 3.2.1 |
| ❌ OverSight | 2.4.0 |
| ❌ Packages | 1.2.10 |
| <img src='Logos/paintbrush.png' width='32' height='32'> Paintbrush | 2.6.0 |
| ❌ Paletro | 1.11.0 |
| ❌ Panic Nova | 12.4 |
| ❌ Parallels Client | 19.4.3 |
| <img src='Logos/parallels_desktop.png' width='32' height='32'> Parallels Desktop | 20.3.0-55895 |
| <img src='Logos/parsec.png' width='32' height='32'> Parsec | 150-98 |
| <img src='Logos/pastebot.png' width='32' height='32'> Pastebot | 2.4.6 |
| <img src='Logos/pdf_expert.png' width='32' height='32'> PDF Expert | 3.10.14 |
| ❌ PDF Pals | 1.9.0 |
| <img src='Logos/pearcleaner.png' width='32' height='32'> Pearcleaner | 4.4.2 |
| <img src='Logos/pgadmin4.png' width='32' height='32'> pgAdmin4 | 9.3 |
| ❌ Philips Hue Sync | 1.12.1.65 |
| ❌ Phoenix Slides | 1.5.9 |
| <img src='Logos/pika.png' width='32' height='32'> Pika | 1.0.2 |
| ❌ PiPHero | 1.2.0 |
| ❌ PixelSnap | 2.6.1 |
| ❌ Platypus | 5.4.1 |
| <img src='Logos/plex.png' width='32' height='32'> Plex | 1.108.1.307 |
| ❌ PlistEdit Pro | 1.9.7 |
| <img src='Logos/podman_desktop.png' width='32' height='32'> Podman Desktop | 1.18.0 |
| ❌ PopChar X | 10.4 |
| ❌ portx | 2.2.12 |
| ❌ Postico | 2.1.2 |
| <img src='Logos/postman.png' width='32' height='32'> Postman | 11.44.0 |
| <img src='Logos/powershell.png' width='32' height='32'> PowerShell | 7.5.1 |
| <img src='Logos/principle.png' width='32' height='32'> Principle | 6.38 |
| <img src='Logos/privileges.png' width='32' height='32'> Privileges | 2.3.0 |
| ❌ ProcessSpy | 1.6.6 |
| ❌ ProNotes | 0.7.7 |
| <img src='Logos/proton_drive.png' width='32' height='32'> Proton Drive | 2.2.0 |
| <img src='Logos/proton_mail.png' width='32' height='32'> Proton Mail | 1.8.0 |
| ❌ Proton Pass | 1.31.1 |
| <img src='Logos/protonvpn.png' width='32' height='32'> ProtonVPN | 4.8.0 |
| <img src='Logos/proxyman.png' width='32' height='32'> Proxyman | 5.19.0 |
| ❌ PS Remote Play | 8.0.0 |
| ❌ Pulsar | 1.128.0 |
| ❌ QLab | 5.4.10 |
| <img src='Logos/qq.png' width='32' height='32'> QQ | 6.9.70 |
| ❌ QSpace Pro | 5.3.2 |
| <img src='Logos/quarto.png' width='32' height='32'> quarto | 1.7.29 |
| <img src='Logos/quicklook_video.png' width='32' height='32'> QuickLook Video | 2.21 |
| <img src='Logos/qview.png' width='32' height='32'> qView | 6.1 |
| ❌ Raindrop.io | 5.6.76 |
| <img src='Logos/rancher_desktop.png' width='32' height='32'> Rancher Desktop | 1.18.2 |
| <img src='Logos/raycast.png' width='32' height='32'> Raycast | 1.97.1 |
| <img src='Logos/reactotron.png' width='32' height='32'> Reactotron | 3.7.7 |
| ❌ Readest | 0.9.38 |
| <img src='Logos/real_vnc_viewer.png' width='32' height='32'> Real VNC Viewer | 7.13.1 |
| <img src='Logos/rectangle.png' width='32' height='32'> Rectangle | 0.87 |
| ❌ Rectangle Pro | 3.51 |
| ❌ Recut | 2.1.7 |
| <img src='Logos/redis_insight.png' width='32' height='32'> Redis Insight | 2.68.0 |
| ❌ Reflector | 4.1.2 |
| <img src='Logos/remote_desktop_manager.png' width='32' height='32'> Remote Desktop Manager | 2025.1.16.1 |
| <img src='Logos/remote_help.png' width='32' height='32'> Remote Help | 1.0.2404171 |
| ❌ Reqable | 2.33.12 |
| <img src='Logos/requestly.png' width='32' height='32'> Requestly | 25.5.1 |
| ❌ Retcon | 1.3.0 |
| ❌ Rhinoceros | 8.18.25100.11002 |
| ❌ Rive | 0.8.2849 |
| ❌ Rocket | 1.9.3 |
| ❌ Rocket Typist | 3.2.2 |
| ❌ Rocket.Chat | 4.3.3 |
| ❌ Rode Central | 2.0.65 |
| ❌ Rode Connect | 1.3.43 |
| <img src='Logos/rotato.png' width='32' height='32'> Rotato | 147 |
| <img src='Logos/rstudio.png' width='32' height='32'> RStudio | 2024.12.1 |
| ❌ RsyncUI | 2.4.1 |
| <img src='Logos/rustdesk.png' width='32' height='32'> RustDesk | 1.3.9 |
| ❌ SABnzbd | 4.5.1 |
| <img src='Logos/santa.png' width='32' height='32'> Santa | 2025.4 |
| ❌ ScreenFocus | 1.1.1 |
| <img src='Logos/shottr.png' width='32' height='32'> Shottr | 1.8.1 |
| <img src='Logos/signal.png' width='32' height='32'> Signal | 7.53.0 |
| ❌ SilentKnight | 2.11 |
| <img src='Logos/sketch.png' width='32' height='32'> Sketch | 101.8 |
| ❌ SketchUp | 2025.0.633.273 |
| <img src='Logos/skim.png' width='32' height='32'> Skim | 1.7.9 |
| <img src='Logos/slack.png' width='32' height='32'> Slack | 4.43.52 |
| ❌ SmartBear SoapUI | 5.8.0 |
| <img src='Logos/snagit.png' width='32' height='32'> Snagit | 2025.1.0 |
| ❌ SoundSiphon | 3.8.2 |
| <img src='Logos/splashtop_business.png' width='32' height='32'> Splashtop Business | 3.7.4.0 |
| ❌ Splice | 5.3.1 |
| <img src='Logos/spline.png' width='32' height='32'> Spline | 0.12.5 |
| <img src='Logos/spotify.png' width='32' height='32'> Spotify | 1.2.62.580 |
| <img src='Logos/sproutcube_shortcat.png' width='32' height='32'> Sproutcube Shortcat | 0.12.0 |
| ❌ SQLPro for MSSQL | 2025.10 |
| ❌ SQLPro for MySQL | 2025.10 |
| ❌ SQLPro for Postgres | 2025.06 |
| ❌ SQLPro for SQLite | 2025.07 |
| ❌ SQLPro Studio | 2025.10 |
| <img src='Logos/squirrel.png' width='32' height='32'> Squirrel | 1.0.3 |
| <img src='Logos/stats.png' width='32' height='32'> Stats | 2.11.42 |
| <img src='Logos/steam.png' width='32' height='32'> Steam | 4.0 |
| ❌ SteerMouse | 5.7.4 |
| <img src='Logos/stretchly.png' width='32' height='32'> Stretchly | 1.17.2 |
| ❌ Studio 3T | 2025.7.0 |
| <img src='Logos/sublime_merge.png' width='32' height='32'> Sublime Merge | 2102 |
| <img src='Logos/sublime_text.png' width='32' height='32'> Sublime Text | 4192 |
| ❌ Superlist | 1.30.0 |
| ❌ superwhisper | 1.45.14 |
| <img src='Logos/suspicious_package.png' width='32' height='32'> Suspicious Package | 4.5 |
| ❌ Swift Shift | 0.26.0 |
| <img src='Logos/sync.png' width='32' height='32'> Sync | 2.2.48 |
| ❌ Syncovery | 10.17.5 |
| <img src='Logos/synology_drive.png' width='32' height='32'> Synology Drive | 3.5.2 |
| <img src='Logos/tableau_desktop.png' width='32' height='32'> Tableau Desktop | 2025.1.1 |
| ❌ TabTab | 1.3.4 |
| <img src='Logos/tailscale.png' width='32' height='32'> Tailscale | 1.82.5 |
| ❌ Taskbar | 1.4.3 |
| ❌ TeaCode | 1.1.3 |
| <img src='Logos/teamviewer_host.png' width='32' height='32'> TeamViewer Host | 15 |
| <img src='Logos/teamviewer_quicksupport.png' width='32' height='32'> TeamViewer QuickSupport | 15 |
| <img src='Logos/telegram_for_macos.png' width='32' height='32'> Telegram for macOS | 11.9 |
| <img src='Logos/tenable_nessus_agent.png' width='32' height='32'> Tenable Nessus Agent | 10.8.4 |
| <img src='Logos/termius.png' width='32' height='32'> Termius | 9.19.4 |
| ❌ TeX Live Utility | 1.54 |
| <img src='Logos/thonny.png' width='32' height='32'> Thonny | 4.1.7 |
| ❌ Threema | 1.2.47 |
| <img src='Logos/tigervnc.png' width='32' height='32'> TigerVNC | 1.15.0 |
| <img src='Logos/todoist.png' width='32' height='32'> Todoist | 9.13.1 |
| ❌ Tofu | 3.0.1 |
| ❌ Topaz Gigapixel AI | 8.3.4 |
| <img src='Logos/trae.png' width='32' height='32'> Trae | 1.0.12491 |
| <img src='Logos/transmission.png' width='32' height='32'> Transmission | 4.0.6 |
| <img src='Logos/transmit.png' width='32' height='32'> Transmit | 5.10.8 |
| ❌ Transnomino | 9.2.2 |
| <img src='Logos/tunnelblick.png' width='32' height='32'> Tunnelblick | 8.0 |
| ❌ Twingate | 2025.114.13304 |
| <img src='Logos/typora.png' width='32' height='32'> Typora | 1.10.10 |
| <img src='Logos/unnaturalscrollwheels.png' width='32' height='32'> UnnaturalScrollWheels | 1.3.0 |
| ❌ UPDF | 1.8.11 |
| <img src='Logos/upscayl.png' width='32' height='32'> Upscayl | 2.15.0 |
| <img src='Logos/utm.png' width='32' height='32'> UTM | 4.6.5 |
| <img src='Logos/veracrypt.png' width='32' height='32'> VeraCrypt | 1.26.20 |
| ❌ Vimcal | 1.0.35 |
| <img src='Logos/vimr.png' width='32' height='32'> VimR | 0.53.0 |
| <img src='Logos/visualvm.png' width='32' height='32'> VisualVM | 2.2 |
| <img src='Logos/vivaldi.png' width='32' height='32'> Vivaldi | 7.3.3635.12 |
| ❌ Viz | 2.2.1 |
| <img src='Logos/vlc_media_player.png' width='32' height='32'> VLC media player | 3.0.21 |
| <img src='Logos/vscodium.png' width='32' height='32'> VSCodium | 1.99.32846 |
| ❌ Wave Terminal | 0.11.2 |
| <img src='Logos/webex_teams.png' width='32' height='32'> Webex Teams | 45.4.1.32313 |
| <img src='Logos/webstorm.png' width='32' height='32'> WebStorm | 2025.1 |
| <img src='Logos/wechat_for_mac.png' width='32' height='32'> WeChat for Mac | 4.0.3.93 |
| <img src='Logos/whatsapp.png' width='32' height='32'> WhatsApp | 2.25.12.73 |
| ❌ WindowKeys | 2.0 |
| <img src='Logos/windows_app.png' width='32' height='32'> Windows App | 11.1.5 |
| <img src='Logos/windsurf.png' width='32' height='32'> Windsurf | 1.7.3 |
| <img src='Logos/winehqstable.png' width='32' height='32'> WineHQ-stable | 10.0 |
| ❌ Wire | 3.40.5285 |
| <img src='Logos/wireshark.png' width='32' height='32'> Wireshark | 4.4.6 |
| ❌ Witch | 4.6.2 |
| ❌ Wondershare Filmora | 13.0.25 |
| ❌ XCA | 2.9.0 |
| <img src='Logos/xmind.png' width='32' height='32'> XMind | 25.01.01061-202501070704 |
| ❌ Xnapper | 1.17.1 |
| <img src='Logos/yaak.png' width='32' height='32'> Yaak | 2025.1.2 |
| <img src='Logos/yubikey_manager.png' width='32' height='32'> Yubikey Manager | 1.2.5 |
| <img src='Logos/zed.png' width='32' height='32'> Zed | 0.184.10 |
| <img src='Logos/zed_attack_proxy.png' width='32' height='32'> Zed Attack Proxy | 2.16.1 |
| <img src='Logos/zen_browser.png' width='32' height='32'> Zen Browser | 1.12.1b |
| <img src='Logos/zenmap.png' width='32' height='32'> Zenmap | 7.95 |
| <img src='Logos/zoom.png' width='32' height='32'> Zoom | 6.4.6.53970 |

> [!NOTE]
> Missing an app? Feel free to [request additional app support](https://github.com/ugurkocde/IntuneBrew/issues/new?labels=app-request) by creating an issue!

## 🔧 Configuration

First decide which authentication method you would like to use. There are currently the following methods implemented:

- System Managed Identity
- User Managed Identity
- ClientSecret & ClientID using App Registration
- Certificate based authentication

### Using System Managed Identity

1. Open your Automation Account and select Account Settings -> Identity.
2. Turn Status on tab "System assigned" to "On".
3. Add the following API permissions to your System Managed Identity using this PowerShell script: [Microsoft Tech Community](https://techcommunity.microsoft.com/blog/integrationsonazureblog/grant-graph-api-permission-to-azure-automation-system-assigned-managed-identity/4278846)
   - DeviceManagementApps.ReadWrite.All
4. Open [Entra admin center](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/~/AppAppsPreview) -> Applications -> Enterprise Applications. Change Filter "Application type" to "Managed Identities" and search for your Automation Account name. Open the entity.
5. Verify that the right permissions are set to the Managed Identity in the Security -> Permissions tab.
6. Create a new Variable in your Automation Account with the name "AuthenticationMethod" and value "SystemManagedIdentity" to use the System Managed Identity.

### Using User Assigned Managed Identity

1. Open [Azure Portal](https://portal.azure.com) and search for "Managed Identities".
2. Click "Create" and select your Azure Subscription & Resource group. Choose your region and set a name for the identity.
3. Open your Automation Account and select Account Settings -> Identity.
4. Switch to tab "User assigned" and click "Add". Choose the previously created Managed Identity.
5. Add the following API permissions to your System Managed Identity using this PowerShell script: [Microsoft Tech Community](https://techcommunity.microsoft.com/blog/integrationsonazureblog/grant-graph-api-permission-to-azure-automation-system-assigned-managed-identity/4278846)
   - DeviceManagementApps.ReadWrite.All
6. Open [Entra admin center](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/~/AppAppsPreview) -> Applications -> Enterprise Applications. Change Filter "Application type" to "Managed Identities" and search for your Automation Account name. Open the entity.
7. Verify that the right permissions are set to the Managed Identity in the Security -> Permissions tab.
8. Create a new Variable in your Automation Account with the name "AuthenticationMethod" and value "UserAssignedManagedIdentity" to use the User Assigned Managed Identity.

### Using ClientSecret from Entra ID App Registration

1. Create a new App Registration in Azure
2. Add the following API permissions:
   - DeviceManagementApps.ReadWrite.All
3. Update the parameters in the script with your Azure details.
   - $appid = '<YourAppIdHere>' # App ID of the App Registration
   - $tenantid = '<YourTenantIdHere>' # Tenant ID of your EntraID
   - $certThumbprint = '<YourCertificateThumbprintHere>' # Thumbprint of the certificate associated with the App Registration

### Certificate-Based Authentication

1. Generate a self-signed certificate:

```powershell
$cert = New-SelfSignedCertificate -Subject "CN=IntuneBrew" -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256 -NotAfter (Get-Date).AddYears(2)
```

2. Export the certificate:

```powershell
$pwd = ConvertTo-SecureString -String "YourPassword" -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath "IntuneBrew.pfx" -Password $pwd
```

3. Upload to Azure App Registration:
   - Go to your App Registration in Azure Portal
   - Navigate to "Certificates & secrets"
   - Upload the public key portion of your certificate

### Copy Assignments

Using the `-CopyAssignments` switch with `IntuneBrew.ps1` or creating a `CopyAssignments` Variable with Boolean Value `true` in your Azure Automation indicates that assignments from the existing app version should be copied to the new version.

### App JSON Structure

Apps are defined in JSON files with the following structure:

```json
{
  "name": "Application Name",
  "description": "Application Description",
  "version": "1.0.0",
  "url": "https://download.url/app.dmg",
  "bundleId": "com.example.app",
  "homepage": "https://app.homepage.com",
  "fileName": "app.dmg"
}
```

## 🔄 Version Management

IntuneBrew implements sophisticated version comparison logic:

- Handles various version formats (semantic versioning, build numbers)
- Supports complex version strings (e.g., "1.2.3,45678")
- Manages version-specific updates and rollbacks
- Provides clear version difference visualization

Version comparison rules:

1. Main version numbers are compared first (1.2.3 vs 1.2.4)
2. Build numbers are compared if main versions match
3. Special handling for complex version strings with build identifiers

## 🛠️ Error Handling

IntuneBrew includes robust error handling mechanisms:

1. **Upload Retry Logic**

   - Automatic retry for failed uploads (up to 3 attempts)
   - Exponential backoff between retries
   - New SAS token generation for expired URLs

2. **File Processing**

   - Temporary file cleanup
   - Handle locked files
   - Memory management for large files

3. **Network Issues**

   - Connection timeout handling
   - Bandwidth throttling
   - Resume interrupted uploads

4. **Authentication**
   - Token refresh handling
   - Certificate expiration checks
   - Fallback to interactive login

## 🤔 Troubleshooting

### Common Issues

1. **File Access Errors**

   - Ensure no other process is using the file
   - Try deleting temporary files manually
   - Restart the script

2. **Upload Failures**

   - Check your internet connection
   - Verify Azure AD permissions
   - Ensure file sizes don't exceed Intune limits

3. **Authentication Issues**
   - Verify your Azure AD credentials
   - Check tenant ID configuration
   - Ensure required permissions are granted

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Thanks to all contributors who have helped shape IntuneBrew
- Microsoft Graph API documentation and community
- The PowerShell community for their invaluable resources

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/ugurkocde/IntuneBrew/issues) page
2. Review the troubleshooting guide
3. Open a new issue if needed

---

Made with ❤️ by [Ugur Koc](https://github.com/ugurkocde)
