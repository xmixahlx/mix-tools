#!/bin/bash

TRANSFERFUNCTIONS="bt470m bt470bg srgb smpte2084 hlg"

ISOINPUT="0100 0200 0300 0400 0500 0600 0700 0800 0900 1000 1100 1200 1300 1400 1500 1600 1700 1800\
 1900 2000 2100 2200 2300 2400 2500 2600 2700 2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800\
 3900 4000 4100 4200 4300 4400 4500 4600 4700 4800 4900 5000 5100 5200 5300 5400 5500 5600 5700 5800\
 5900 6000 6100 6200 6300 6400"

rm -Rf photon-tables
mkdir -p photon-tables/{bt470m,bt470bg,srgb,smpte2084,hlg}/{SD,HD,2K,3K,4K,5K,8K}

for TRANSFER in $TRANSFERFUNCTIONS;
do
 # SD
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 854 -l 480 -i "$ISO"\
  -o "photon-tables/$TRANSFER/SD/photon-table-$TRANSFER-SD-$ISO.tbl";
 done

 # HD
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 1280 -l 720 -i "$ISO"\
  -o "photon-tables/$TRANSFER/HD/photon-table-$TRANSFER-HD-$ISO.tbl";
 done

 # 2K
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 1920 -l 1080 -i "$ISO"\
  -o "photon-tables/$TRANSFER/2K/photon-table-$TRANSFER-2K-$ISO.tbl";
 done

 # 3K
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 2880 -l 1620 -i "$ISO"\
  -o "photon-tables/$TRANSFER/3K/photon-table-$TRANSFER-3K-$ISO.tbl";
 done

 # 4K
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 3840 -l 2160 -i "$ISO"\
  -o "photon-tables/$TRANSFER/4K/photon-table-$TRANSFER-4K-$ISO.tbl";
 done

 # 5K
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 5120 -l 2880 -i "$ISO"\
  -o "photon-tables/$TRANSFER/5K/photon-table-$TRANSFER-5K-$ISO.tbl";
 done

 # 8K
 for ISO in $ISOINPUT;
 do
  aom_photon_noise_table -t "$TRANSFER" -w 7680 -l 4320 -i "$ISO"\
  -o "photon-tables/$TRANSFER/8K/photon-table-$TRANSFER-8K-$ISO.tbl";
 done
done

exit
