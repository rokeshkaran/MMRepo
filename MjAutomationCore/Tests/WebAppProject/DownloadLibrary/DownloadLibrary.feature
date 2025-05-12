@retry(2)
Feature: DownloadLibrary
Check Download Library functionality

Background: Pre-condition
	Given User navigate to MindManager Download Library web app

@MindManager @DownloadLibrary @App_Prod
Scenario Outline: Check_that_user_is_able_to_view_MindManager_Windows
	Then 'MindManager Desktop' section header is displayed on Download Library page
	Then '<subSection>' subsection is displayed in 'MindManager Desktop' header section on Download Library page
	Then following items is displayed under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
		| Items                        |
		| Download desktop application |
		| Release Notes                |
		| Online help and user guide   |
		| Migration guide              |
Examples:
	| subSection                   |
	| MindManager Windows 22       |
	| MindManager Windows 21       |
	| MindManager 2020 for Windows |

@MindManager @DownloadLibrary @App_Prod
Scenario Outline: Check_that_user_is_able_to_view_MindManager_Release_Notes_and_Migration_guide
	Then 'MindManager Desktop' section header is displayed on Download Library page
	Then '<subSection>' subsection is displayed in 'MindManager Desktop' header section on Download Library page
	Then '<link>' Link is displayed under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
	Then User clicks on '<link>' Link under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
	When User switches to '1' tab
	When User waits for data loading
	Then page url is '<URL>'
Examples:
	| subSection                   | link            | URL                                                                                                                                                                                        |
	| MindManager Windows 22       | Release Notes   | https://download.mindjet.com/MindManager_22_2_Windows_Release_Notes_EN.pdf                                                                                                                 |
	| MindManager Windows 21       | Release Notes   | https://download.mindjet.com/MindManager_21_Windows_Release_Notes_EN.pdf?_gl=1*1m2857x*_ga*MTU0OTA2MzUwNi4xNjY4NTg1MTY4*_ga_4JRX37E4V2*MTY3Nzg0Nzk0NS4xNy4xLjE2Nzc4NDkyNTguMC4wLjA.        |
	| MindManager 2020 for Windows | Release Notes   | https://download.mindjet.com/MindManager_2020_SP1_Windows_Release_Notes_EN.pdf?_gl=1*1uw488f*_ga*MTU0OTA2MzUwNi4xNjY4NTg1MTY4*_ga_4JRX37E4V2*MTY3Nzg0Nzk0NS4yMC4xLjE2NzgxNzQ1NTcuMC4wLjA.  |
	| MindManager Windows 22       | Migration guide | https://www.mindmanager.com/static/mm/docs/MindManagerMigration.pdf                                                                                                                        |
	| MindManager Windows 21       | Migration guide | https://www.mindmanager.com/static/mm/docs/MindManagerMigration.pdf                                                                                                                        |
	| MindManager 2020 for Windows | Migration guide | https://download.mindjet.com/MindManagerMigration.pdf?_gl=1*1snkqgw*_ga*MTU0OTA2MzUwNi4xNjY4NTg1MTY4*_ga_4JRX37E4V2*MTY3Nzg0Nzk0NS4yMC4xLjE2NzgxNzQ2NzUuMC4wLjA.                           |
	| MindManager Mac 22 (14)      | Release Notes   | https://share.mindmanager.com/#publish/4tNOW_PRhtGyAz-_6JlLabJiyU0VXbRblNOhogdR                                                                                                            |
	| MindManager Mac 13           | Release Notes   | https://download.mindjet.com/Mac/MindManager_for_Mac_13_2_206_Release_Notes.pdf?_gl=1*2i089r*_ga*MTU0OTA2MzUwNi4xNjY4NTg1MTY4*_ga_4JRX37E4V2*MTY3Nzg0Nzk0NS4xOC4xLjE2NzgwODU4MzguMC4wLjA.  |
	| MindManager 12 for Mac       | Release Notes   | https://download.mindjet.com/Mac/MindManager_for_Mac_12_1_200_Release_Notes.pdf?_gl=1*1kcelkt*_ga*MTU0OTA2MzUwNi4xNjY4NTg1MTY4*_ga_4JRX37E4V2*MTY3Nzg0Nzk0NS4xOC4xLjE2NzgwODYzMDIuMC4wLjA. |

@MindManager @DownloadLibrary @App_Prod
Scenario Outline: Check_that_user_is_able_to_download_MindManager
	Then 'MindManager Desktop' section header is displayed on Download Library page
	Then '<subSection>' subsection is displayed in 'MindManager Desktop' header section on Download Library page
	Then 'Download desktop application' Link is displayed under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
	Then User clicks on 'Download desktop application' Link under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
	Then User checks that file '<downloadedFile>' was downloaded
	Then '<downloadedFile>' downloaded file has '<fileSize>' MB size
Examples:
	| subSection                   | downloadedFile                       | fileSize           |
	| MindManager Windows 22       | MindManager22_setup.exe              | 1.14               |
	| MindManager Windows 21       | MindManager21_setup.exe              | 1.1799999999999999 |
	| MindManager 2020 for Windows | MindManager2020_setup-dlb.exe        | 1.2                |
	| MindManager Mac 22 (14)      | MindManager_Mac_22.2.321.dmg         | 178                |
	| MindManager Mac 13           | MindManager_Mac_13.2.206.dmg         | 178.91999999999999 |
	| MindManager 12 for Mac       | Mindjet_MindManager_Mac_12.1.200.dmg | 160.65000000000001 |

@MindManager @DownloadLibrary @App_Prod
Scenario Outline: Check_that_user_is_able_to_view_MindManager_Online_help_and_user_guide
	Then 'MindManager Desktop' section header is displayed on Download Library page
	Then '<subSection>' subsection is displayed in 'MindManager Desktop' header section on Download Library page
	Then '<link>' Link is displayed under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
	Then User clicks on '<link>' Link under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
	When User waits for data loading
	Then page url is 'https://www.mindmanager.com/en/support/product-registration/user-manuals-and-online-help/'
Examples:
	| subSection                   | link                       |
	| MindManager Windows 22       | Online help and user guide |
	| MindManager Windows 21       | Online help and user guide |
	| MindManager 2020 for Windows | Online help and user guide |
	| MindManager Mac 22 (14)      | Online help                |
	| MindManager Mac 13           | Online help                |
	| MindManager 12 for Mac       | Online help                |

@MindManager @DownloadLibrary @App_Prod
Scenario Outline: Check_that_user_is_able_to_view_MindManager_Mac
	Then 'MindManager Desktop' section header is displayed on Download Library page
	Then '<subSection>' subsection is displayed in 'MindManager Desktop' header section on Download Library page
	Then following items is displayed under '<subSection>' subsection in 'MindManager Desktop' header section on Download Library page
		| Items                        |
		| Download desktop application |
		| Release Notes                |
		| Online help                  |
Examples:
	| subSection              |
	| MindManager Mac 22 (14) |
	| MindManager Mac 13      |
	| MindManager 12 for Mac  |

@MindManager @DownloadLibrary @App_Prod
Scenario: Check_that_user_is_able_to_view_MindManager_for_Microsoft_Teams
	Then 'MindManager for Microsoft Teams' section header is displayed on Download Library page
	Then 'Get it from Microsoft AppSource' subsection is displayed in 'MindManager for Microsoft Teams' header section on Download Library page
	Then following items is displayed under 'Get it from Microsoft AppSource' subsection in 'MindManager for Microsoft Teams' header section on Download Library page
		| Get it from Microsoft AppSource |
		| Software installation           |
		| Overview video                  |
		| Release notes                   |
		| Quick Start Guide               |

@MindManager @DownloadLibrary @App_Prod
Scenario Outline: Check_that_user_is_able_to_view_MindManager_Other_links
	Then '<sectionHeader>' section header is displayed on Download Library page
	Then '<subSection>' subsection is displayed in '<sectionHeader>' header section on Download Library page
	Then '<link >' Link is displayed under '<subSection>' subsection in '<sectionHeader>' header section on Download Library page
	Then User clicks on '<link >' Link under '<subSection>' subsection in '<sectionHeader>' header section on Download Library page
	When User waits for data loading
	Then page url is '<URL>'
Examples:
	| sectionHeader                   | subSection                      | link                  | URL                                                                             |
	| MindManager for Microsoft Teams | Get it from Microsoft AppSource | Software installation | https://appsource.microsoft.com/en-US/product/office/WA200002261?exp=ubp8       |
	| MindManager for Microsoft Teams | Get it from Microsoft AppSource | Overview video        | https://vimeo.com/451554214/ef0b65e9a4                                          |
	| MindManager for Microsoft Teams | Get it from Microsoft AppSource | Release notes         | https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq |
	| MindManager for Microsoft Teams | Get it from Microsoft AppSource | Quick Start Guide     | https://www.mindmanager.com/static/mm/docs/2021/teams-quick-start-guide-en.pdf  |
	| MindManager Web                 | Online version                  | Release notes         | https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq |
	| MindManager Chromebook          | Software installation           | Get the application   | https://play.google.com/store/apps/details?id=com.corel.mindmanager.twa         |
	| MindManager Chromebook          | Software installation           | Release notes         | https://share.mindmanager.com/#publish/9Vz-cnj9jsjZW-I-mjtP2LZhpQ3rwOaG2yD-Mvwq |

@MindManager @DownloadLibrary @App_Prod
Scenario: Check_that_user_is_able_to_view_MindManager_Web
	Then 'MindManager Web' section header is displayed on Download Library page
	Then 'Online version' subsection is displayed in 'MindManager Web' header section on Download Library page
	Then following items is displayed under 'Online version' subsection in 'MindManager Web' header section on Download Library page
		| Online version |
		| Sign in        |
		| Release notes  |

@MindManager @DownloadLibrary @App_Prod
Scenario: Check_that_user_is_able_to_view_MindManager_Web_Sign_In
	Then 'MindManager Web' section header is displayed on Download Library page
	Then 'Online version' subsection is displayed in 'MindManager Web' header section on Download Library page
	Then 'Sign in' Link is displayed under 'Online version' subsection in 'MindManager Web' header section on Download Library page
	Then User clicks on 'Sign in' Link under 'Online version' subsection in 'MindManager Web' header section on Download Library page
	When User switches to '1' tab
	Then page url is 'https://app.mindmanager.com/'

@MindManager @DownloadLibrary @App_Prod
Scenario: Check_that_user_is_able_to_view_MindManager_Chromebook
	Then 'MindManager Chromebook' section header is displayed on Download Library page
	Then 'Software installation' subsection is displayed in 'MindManager Chromebook' header section on Download Library page
	Then following items is displayed under 'Software installation' subsection in 'MindManager Chromebook' header section on Download Library page
		| Software installation |
		| Get the application   |
		| Release notes         |