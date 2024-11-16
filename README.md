![IntuneBrew_Header](https://github.com/user-attachments/assets/c036ff17-ecad-4615-a7b5-6ffbd3d4ebf1)

<h1 align="center">🍺 IntuneBrew</h1>

IntuneBrew is a PowerShell-based tool that simplifies the process of uploading and managing macOS applications in Microsoft Intune. It automates the entire workflow from downloading apps to uploading them to Intune, complete with proper metadata and logos.

## 📚 Table of Contents
- [📚 Table of Contents](#-table-of-contents)
- [🚨 Public Preview Notice](#-public-preview-notice)
- [✨ Features](#-features)
- [🎬 Demo](#-demo)
- [🚀 Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [📝 Usage](#-usage)
  - [Basic Usage](#basic-usage)
  - [📱 Supported Applications](#-supported-applications)
- [🔧 Configuration](#-configuration)
  - [Azure App Registration](#azure-app-registration)
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

*Last checked: 2024-11-16 00:15 UTC*

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

## 🎬 Demo
![IntuneBrew Demo](IntuneBrew_Demo.gif)
## 🚀 Getting Started

### Prerequisites

- PowerShell 7.0 or higher
- Microsoft Graph PowerShell SDK
- Azure App Registration with appropriate permissions OR Manual Connection via Interactive Sign-In
- Windows or macOS operating system

### Installation

1. Clone the repository:
2. Install required PowerShell modules:

```powershell
Install-Module Microsoft.Graph.Authentication -Scope CurrentUser
```

3. Configure your environment variables or update the config file with your Azure AD details.

## 📝 Usage

### Basic Usage

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
| <img src='Logos/adobe_acrobat_pro_dc.png' width='32' height='32'> Adobe Acrobat Pro DC | 24.004.20272 |
| <img src='Logos/adobe_acrobat_reader.png' width='32' height='32'> Adobe Acrobat Reader | 24.004.20219 |
| <img src='Logos/adobe_creative_cloud.png' width='32' height='32'> Adobe Creative Cloud | 6.4.0.361 |
| <img src='Logos/android_studio.png' width='32' height='32'> Android Studio | 2024.2.1.11 |
| <img src='Logos/anydesk.png' width='32' height='32'> AnyDesk | 8.1.4 |
| <img src='Logos/asana.png' width='32' height='32'> Asana | 1.0 |
| <img src='Logos/bitwarden.png' width='32' height='32'> Bitwarden | 2024.11.1 |
| <img src='Logos/blender.png' width='32' height='32'> Blender | 4.2.3 |
| <img src='Logos/brave.png' width='32' height='32'> Brave | 1.73.89.0 |
| <img src='Logos/canva.png' width='32' height='32'> Canva | 1.97.0 |
| <img src='Logos/company_portal.png' width='32' height='32'> Company Portal | 5.2409.1 |
| <img src='Logos/deepl.png' width='32' height='32'> DeepL | 1.0 |
| <img src='Logos/docker_desktop.png' width='32' height='32'> Docker Desktop | 4.35.1,173168 |
| <img src='Logos/dropbox.png' width='32' height='32'> Dropbox | 212.4.5767 |
| <img src='Logos/evernote.png' width='32' height='32'> Evernote | 10.105.4,20240910164757,a2e60a8d876a07eded5d212fa56ba45214114ad0 |
| <img src='Logos/google_chrome.png' width='32' height='32'> Google Chrome | 131.0.6778.70 |
| <img src='Logos/grammarly_desktop.png' width='32' height='32'> Grammarly Desktop | 1.95.4.0 |
| <img src='Logos/keepassxc.png' width='32' height='32'> KeePassXC | 2.7.9 |
| <img src='Logos/krisp.png' width='32' height='32'> Krisp | 2.46.11 |
| <img src='Logos/microsoft_teams.png' width='32' height='32'> Microsoft Teams | 24277.3502.3161.3007 |
| <img src='Logos/miro.png' width='32' height='32'> Miro | 0.8.74 |
| <img src='Logos/mongodb_compass.png' width='32' height='32'> MongoDB Compass | 1.44.6 |
| <img src='Logos/mozilla_firefox.png' width='32' height='32'> Mozilla Firefox | 132.0.2 |
| <img src='Logos/notion.png' width='32' height='32'> Notion | 4.0.0 |
| <img src='Logos/obsidian.png' width='32' height='32'> Obsidian | 1.7.6 |
| <img src='Logos/parallels_desktop.png' width='32' height='32'> Parallels Desktop | 20.1.1-55740 |
| <img src='Logos/real_vnc_viewer.png' width='32' height='32'> Real VNC Viewer | 7.12.1 |
| <img src='Logos/remote_help.png' width='32' height='32'> Remote Help | 1.0.2404171 |
| <img src='Logos/rstudio.png' width='32' height='32'> RStudio | 2024.09.1,394 |
| <img src='Logos/signal.png' width='32' height='32'> Signal | 7.33.0 |
| <img src='Logos/slack.png' width='32' height='32'> Slack | 4.41.97 |
| <img src='Logos/snagit.png' width='32' height='32'> Snagit | 2024.4.0 |
| <img src='Logos/spotify.png' width='32' height='32'> Spotify | 1.2.50.335 |
| <img src='Logos/suspicious_package.png' width='32' height='32'> Suspicious Package | 4.5,1213 |
| <img src='Logos/synology_drive.png' width='32' height='32'> Synology Drive | 3.5.1,16102 |
| <img src='Logos/tableau_desktop.png' width='32' height='32'> Tableau Desktop | 2024.2.4 |
| <img src='Logos/teamviewer_quicksupport.png' width='32' height='32'> TeamViewer QuickSupport | 15 |
| <img src='Logos/todoist.png' width='32' height='32'> Todoist | 9.9.0 |
| <img src='Logos/utm.png' width='32' height='32'> UTM | 4.5.4 |
| <img src='Logos/vlc_media_player.png' width='32' height='32'> VLC media player | 3.0.21 |
| <img src='Logos/webex_teams.png' width='32' height='32'> Webex Teams | 44.11.0.31172 |
| <img src='Logos/windows_app.png' width='32' height='32'> Windows App | 11.0.6 |
| <img src='Logos/xmind.png' width='32' height='32'> XMind | 24.10.01101-202410201844 |
| <img src='Logos/zoom.png' width='32' height='32'> Zoom | 6.2.6.41824 |

> [!NOTE]
> Missing an app? Feel free to [request additional app support](https://github.com/ugurkocde/IntuneBrew/issues/new?labels=app-request) by creating an issue!

## 🔧 Configuration

### Azure App Registration

1. Create a new App Registration in Azure
2. Add the following API permissions:
   - DeviceManagementApps.ReadWrite.All
3. Update the parameters in the script with your Azure details.
    - $appid = '<YourAppIdHere>' # App ID of the App Registration
    - $tenantid = '<YourTenantIdHere>' # Tenant ID of your EntraID
    - $certThumbprint = '<YourCertificateThumbprintHere>' # Thumbprint of the certificate associated with the App Registration

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
