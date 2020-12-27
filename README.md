# pornhub-premium-scrapper
simple bash script to scrape premium videos (premium account needed)  
⚠ this may not get all the videos first run through depending on amount of vids  
⚠ this will run through all models & stars when you start it again  

this is basically a much simpler version of [this](https://github.com/mariosemes/PornHub-downloader) deprecated script by [mariosemes](https://github.com/mariosemes) solely for the purpose of premium videos.  
*seeing as i dont value my time, this script does not have the refresh option his had*

## Requirements:

- youtube-dl (will not run without this)
- cookies.txt file from an account with premium

*you can get your cookies either using* [Get cookies.txt](https://chrome.google.com/webstore/detail/get-cookiestxt/bgaddhkoddajcdgocldbbfleckgcbcid) *for chrome or* [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search) *for firefox.*  
*cookies file should be in the same folder as the script to work*

## Installation

```
 $ git clone https://github.com/agnosto/pornhub-premium-scrapper.git
 $ cd pornhub-premium-scrapper
 $ chmod +x ./scrape.sh
```

## Usage 

To add models/pornstars to scrape  
`
 $ ./scrape.sh add [model/pornstar name] 
`  
To start the script  
`
 $ ./scrape.sh start 
`  
To view help  
`
 $ ./scrape.sh -h
`
