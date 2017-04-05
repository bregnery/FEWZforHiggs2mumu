#!/bin/bash
#   Dimitri Bourilkov   UF   06-Jun-2012
#   Run fewzz job  DY 1D in M   no PI bkg
#   $1 == input parameter (sector # for NNLO [0,126])
#   $2 == input parameter (working directory)
#   $3 == input parameter (output file name)

if [ $# -lt 3 ]
then
   echo "Must provide input parameter as \$1 !    Aborting."
   echo "Must provide working directory as \$2 !  Aborting."
   echo "Must provide output file name as \$3 !   Aborting."
   exit 1
fi

dir=$2

  mydir=/ufrc/avery/bregnery/FEWZforHiggs2mumu/FEWZ/FEWZ_3.1.b2/bin/$dir
# echo $mydir
cd $mydir

let dirnum=$1
subdir=$dir$dirnum
mkdir -p $subdir
cd $subdir
echo "Working in "`pwd`

echo "Will run FEWZ job with parameter: "$1
echo "Will run FEWZ job with output file: "$3

/bin/hostname -f

# ../fewzz -i ../input_dy_MY.txt -h ../histograms.txt -o out_dy13tev_noPI_NLO_WNLO_4pi.txt -p ../../.. >> screen.out
# ../fewzz -i ../input_dy.txt -h ../histograms_dy.txt -o out_mm13tev_noPI_NNLO_WNLO_acczpr.txt -p ../../.. -s $1 >> screen.out
# ../fewzz -i ../input_dy.txt -h ../histograms_dy.txt -o out_mm13tev_noPI_NNLO_WNLO_acczpr-sc0-5.txt -p ../../.. -s $1 >> screen.out
../fewzz -i ../input_dy.txt -h ../histograms_dy.txt -o $3 -p ../../.. -s $1 >> screen.out

