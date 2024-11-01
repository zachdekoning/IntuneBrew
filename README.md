<h1 align="center">🍺 IntuneBrew</h1>

IntuneBrew is a PowerShell-based tool that simplifies the process of uploading and managing macOS applications in Microsoft Intune. It automates the entire workflow from downloading apps to uploading them to Intune, complete with proper metadata and logos.

![IntuneBrew Demo](IntuneBrew_Demo.gif)

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

## ✨ Features
- 🚀 Automated app uploads to Microsoft Intune
- 📦 Supports both .dmg and .pkg files
- 🔄 Automatic version checking and updates
- 🖼️ Automatic app icon integration
- 📊 Progress tracking for large file uploads
- 🔐 Secure authentication with Microsoft Graph API
- 🎯 Smart duplicate detection
- 💫 Bulk upload support

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

| Logo | Application | Latest Version | Last Updated |
|------|------------|----------------|--------------|
| <img src='Logos/1password.png' width='32' height='32'> | 1Password | 8.10.50 | 2024-11-01 |
| <img src='Logos/adobe_acrobat_reader.png' width='32' height='32'> | Adobe Acrobat Reader | 24.004.20219 | 2024-11-01 |
| <img src='Logos/bitwarden.png' width='32' height='32'> | Bitwarden | 2024.10.2 | 2024-11-01 |
| <img src='Logos/blender.png' width='32' height='32'> | Blender | 4.2.3 | 2024-11-01 |
| <img src='Logos/canva.png' width='32' height='32'> | Canva | 1.97.0 | 2024-11-01 |
| <img src='Logos/company_portal.png' width='32' height='32'> | Company Portal | 5.2409.1 | 2024-11-01 |
| <img src='Logos/docker_desktop.png' width='32' height='32'> | Docker Desktop | 4.35.1,173168 | 2024-11-01 |
| <img src='Logos/google_chrome.png' width='32' height='32'> | Google Chrome | 130.0.6723.92 | 2024-11-01 |
| <img src='Logos/grammarly_desktop.png' width='32' height='32'> | Grammarly Desktop | 1.93.5.0 | 2024-11-01 |
| <img src='Logos/keepassxc.png' width='32' height='32'> | KeePassXC | 2.7.9 | 2024-11-01 |
| <img src='Logos/microsoft_teams.png' width='32' height='32'> | Microsoft Teams | 24277.3502.3161.3007 | 2024-11-01 |
| <img src='Logos/miro.png' width='32' height='32'> | Miro | 0.8.74 | 2024-11-01 |
| <img src='Logos/mongodb_compass.png' width='32' height='32'> | MongoDB Compass | 1.44.6 | 2024-11-01 |
| <img src='Logos/mozilla_firefox.png' width='32' height='32'> | Mozilla Firefox | 132.0 | 2024-11-01 |
| <img src='Logos/parallels_desktop.png' width='32' height='32'> | Parallels Desktop | 20.1.1-55740 | 2024-11-01 |
| <img src='Logos/slack.png' width='32' height='32'> | Slack | 4.41.97 | 2024-11-01 |
| <img src='Logos/snagit.png' width='32' height='32'> | Snagit | 2024.3.2 | 2024-11-01 |
| <img src='Logos/spotify.png' width='32' height='32'> | Spotify | 1.2.49.439 | 2024-11-01 |
| <img src='Logos/synology_drive.png' width='32' height='32'> | Synology Drive | 3.5.1,16101 | 2024-11-01 |
| <img src='Logos/todoist.png' width='32' height='32'> | Todoist | 9.9.0 | 2024-11-01 |
| <img src='Logos/vlc_media_player.png' width='32' height='32'> | VLC media player | 3.0.21 | 2024-11-01 |
| <img src='Logos/webex_teams.png' width='32' height='32'> | Webex Teams | 44.10.1.31028 | 2024-11-01 |
| <img src='Logos/windows_app.png' width='32' height='32'> | Windows App | 11.0.6 | 2024-11-01 |
| <img src='Logos/xmind.png' width='32' height='32'> | XMind | 24.10.01101-202410201844 | 2024-11-01 |
| <img src='Logos/zoom.png' width='32' height='32'> | Zoom | 6.2.6.41824 | 2024-11-01 |

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
