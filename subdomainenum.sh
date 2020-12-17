#!/bin/sh
filename=$1
while read line; do
        echo "Subfinder"
        subfinder -dL $line -o $line.txt
         
        echo "Sublister"
        cd /root/Sublist3r && python3 sublist3r.py -d $line -o $line.txt

        echo "finedomain-linux"
        cd /root/ && ./findomain-linux -f $line --output 

        echo "Assetfinder"
        assetfinder --subs-only $line | tee -a $line.txt
				
        sort -u $line.txt -o $line.txt
done < $filename
#./subdomainenum.sh subdomain.txt
#By Animesh Mallick ( ZEMO )
#Youtube: https://www.youtube.com/channel/UCVmMpbOCHnXLsXq2VlSm0bw/featured
#Twitter: https://twitter.com/Z3MO_
#Insta:   https://www.instagram.com/zemo672/
