#!/bin/bash
###Forensic tools install
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
    echo ""
    mkdir ~/Desktop/Cases 
    mkdir ~/Desktop/Tools
  
# Add scripts from different sources
    cd ~/Desktop/Tools/
    apt-get install sleuthkit autopsy -y
#Critical Stack
    wget -q -O https://intel.criticalstack.com/client/critical-stack-intel-amd64.deb
    dpkg -i critical-stack-intel*

# https://www.virustotal.com/en/documentation/public-api/#getting-file-scans
    wget -q -O ~/Desktop/Tools/vt.py \
    https://raw.githubusercontent.com/Xen0ph0n/VirusTotal_API_Tool/master/vt.py && \
    chmod +x ~/Desktop/Tools/vt.py 
    echo "Installed vt.py"
    
# https://n0where.net/malware-analysis-damm/
    git clone --quiet https://github.com/504ensicsLabs/DAMM 
    echo "Installed DAMM"
     
# https://github.com/DidierStevens/DidierStevensSuite
    git clone --quiet https://github.com/DidierStevens/DidierStevensSuite.git 
    echo "Checked out DidierStevensSuite." 
    
# https://github.com/Yara-Rules/rules.git
    git clone --quiet https://github.com/Yara-Rules/rules.git 
    echo "Checked out Yara-Rules."

# https://github.com/decalage2/oletools.git
    git clone --quiet https://github.com/decalage2/oletools.git 
    echo "Checked out oletools."
    
    git clone --quiet https://github.com/USArmyResearchLab/Dshell.git
    echo "Checked out DShell."
    
     git clone --quie https://github.com/BinaryDefense/goatrider.git
    echo "Checked out GoatRider."
    
    apt-get -qq install yara -y
    
    #Volatility   
    git clone --quiet https://github.com/volatilityfoundation/volatility.git
    echo "Dwonloaded Volatility"
    cd volatility
    python setup.py install

