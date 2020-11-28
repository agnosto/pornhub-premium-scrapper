#!/usr/bin/env bash

action=$1
command=$2
models='models.txt'
stars='stars.txt'
cookie='cookies.txt'

if [ "$action" == 'start' ]
    then
      echo Scraping models premium vids
      while IFS= read -r line; do
        mkdir ./vids-scraped/models/$line
        youtube-dl --cookies $cookie --output './vids-scraped/models/'"$line"'/%(title)s.%(ext)s' --no-warnings https://www.pornhubpremium.com/model/$line/videos/premium
        echo Done scraping videos from $line
        echo "-------------------"
        sleep 3
      done < $models

      echo Scrapping pornstars premium vids
      while IFS= read -r line; do
        mkdir .vids-scraped/stars/$line
        youtube-dl --cookies $cookie --output './vids-scraped/stars/'"$line"'/%(title)s.%(ext)s' --no-warnings https://www.pornhubpremium.com/pornstar/$line/videos/premium
        echo Done scraping videos from $line
        echo "-------------------"
      done < $stars

      echo Script run `date "+%H:%M:%S   %d/%m/%y"` >> ./phscraper.log


elif [ "$action" == 'add' ]
    then
      
      if [ "$command" == '' ]
        then
           clear
           echo "-------------------"
           echo "Uasge: ./phscrape.sh add model-name"
           echo "-------------------"
           exit 1;
        else

           pornstarcheck=$(curl -s --head -w %{http_code} https://www.pornhub.com/pornstar/$command -o /dev/null)
           if [ "$pornstarcheck" == '200'  ]
           then
             if grep -Fxq "$command" $stars
              then
                echo Pornstar already in file.
                exit 1;
              else
                echo $command >> $stars
                echo "Pornstar added."
                echo "-------------------"
              fi
              exit 1;
           else
             echo $command is not a pornstar.
           fi

           modelcheck=$(curl -s --head -w %{http_code} https://www.pornhub.com/model/$command -o /dev/null)
           if [ "$modelcheck" == '200' ]
           then 
            if grep -Fxq "$command" $models
             then
               echo Medel already in file.
               exit 1;
             else
               echo $command >> $models
               echo "Model added."
               echo "-------------------"
             fi
             exit 1;
           else
             echo $command is not a model.
           fi
      fi  

elif [ "$action" == '-h' ]
    then
        clear
        echo "-------------------"
        echo "Super helpful help message"
        echo "-------------------"
        echo "start (starts the script)"
        echo "add *model/pornstar (adds to list to be scraped)"
        echo "-h (shows this message)"
        echo "-------------------"
        echo "Example useage: ./phscrape.sh add {model name}"
        echo "-------------------"
        exit 1;
    else
        clear
        echo "-------------------"
        echo "Please use ./phscrape.sh -h for help"
        echo "-------------------"

fi
