# Qlik Sense QRS API- Export SenseApp
Script to export/download app from Qlik Sense Server

# ReadMe
- The machine from where you run this script must be reachable to the Qlik Sense, and necessary port needs to be opened such as 4242.
- Sense Certificate must be imported into Windows Certificate store Current User > Personal in the machine where you run this script.
   Following public article may be useful on how to export/import certificate.
   https://qliksupport.force.com/articles/000005433
- You may need to change FQDN, appid, exporedtFolderPath, exportedAppName, UserDirectory and UserId based on your environment
   

# Instruction
1. Donwload QRS_ExportApp.ps1 onto your machine
2. Follow each bullets stated in ReadMe
3. Open Windows Powershell and move to the folder where you saved QRS_ExportApp.ps1 on Powershell Console
4. Run .\QRS_ExportApp.ps1
5. Start Time and Finish Time captures onto Powershell consule
6. Once Finished Time displays on Powershell Console, go to exporteFolderPath and you can find the generated app


# Requirement
Qlik Sense


# Disclaimer
The scripts is not supported by Qlik. Please use it on your own risk
# License
This project is provided "AS IS", without any warranty, under the MIT License - see the LICENSE file for details
