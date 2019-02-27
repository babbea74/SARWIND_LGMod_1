echo "--------------------------------------------------------------"
echo "CONTENT OF THE CURRENT FOLDER"
ls -a .
echo "--------------------------------------------------------------"
unzip ./InData.zip 
if [ -f /tmp/.X1-lock ]; then
    rm -f /tmp/.X1-lock
fi
if [ -d /tmp/.X11-unix ]; then
    rm -rf /tmp/.X11-unix
fi
vnc4server
export DISPLAY=$HOSTNAME:1
./run_SARWIND_LGMod_v401.sh /MCR_R2011b/v716 ./InData/SARWIND_IO_Info.txt ./InData/SARWIND_Settings.txt
ls ./OutData/S1A_IW_GRDH_1SSV_20141212T055753_087A_SARWIND_LG_AllInOne_v401_AOI_L2001_18000P9001_25000_EstWin1280x1280_L2P2T3_UPP0.45_AlphaStepDeg0.1_ULGPRloc0_100 > text
zip -r OutData.zip OutData
find ./OutData -name *_Results.txt -exec mv {} . \;
find . -name *_Results.txt -exec mv {} SARWIND_LGMod_Results.txt \;
cat  SARWIND_LGMod_Results.txt text >  SARWIND_LGMod_Results.txt
