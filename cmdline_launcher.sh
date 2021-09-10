#!/bin/bash
i=0;
algo="Autolykos";
configFile="ergonomi.ini"
> $configFile;
while [[ "$#" -gt 0 ]]; do
  if echo "$1" | grep -q "algo"; then
    algo=$1;
  else
    if (($((i % 2)) == 0)); then
      a=$1;
      echo -n ${a:1}= >> $configFile;
    else
      if [ "$algo" == "Autolykos" ]; then
        echo $1 >> $configFile;
      else
        echo [$1] >> $configFile;
      fi
      algo="Autolykos";
    fi
  fi
  i=$((i+1));
shift; done
./bonbonnano $configFile
