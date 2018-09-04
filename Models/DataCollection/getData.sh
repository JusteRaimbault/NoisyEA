
# target
#http://coco.gforge.inria.fr/data-archive/bbob-noisy/2009/ALPS_hornby_noisy.tgz

TARGET_DIR=$CS_HOME/NoisyEA/Data/coco
SOURCE_ROOT=http://coco.gforge.inria.fr/data-archive
BENCH="bbob-noisy"
START_YEAR=2009
END_YEAR=2016

mkdir $TARGET_DIR/$BENCH
rm $TARGET_DIR/$BENCH/.gitignore

for YEAR in `seq $START_YEAR $END_YEAR`
do
    echo "$YEAR"
    mkdir files
    rm -rf $TARGET_DIR/$BENCH/$YEAR
    rm $TARGET_DIR/$BENCH/tmp
    # get files list : curl http://coco.gforge.inria.fr/data-archive/bbob-noisy/2009/ | grep "<a href" | grep ".tgz" | awk -F"\"" '{print $8}'
    curl --silent $SOURCE_ROOT/$BENCH/$YEAR/ | grep "<a href" | grep "gz" | awk -F"\"" '{print $8}' > $TARGET_DIR/$BENCH/tmp
    #cat $TARGET_DIR/$BENCH/tmp | awk '{print "wget '$SOURCE_ROOT'/'$BENCH'/'$YEAR'/'"$0" files"}' | sh
    cd files
    while read p; do
       echo "$p"
       wget $SOURCE_ROOT/$BENCH/$YEAR/$p
    done <$TARGET_DIR/$BENCH/tmp
    cd ..
    mv files $TARGET_DIR/$BENCH/$YEAR
    mv $TARGET_DIR/$BENCH/tmp $TARGET_DIR/$BENCH/$YEAR.csv
    echo "$YEAR" >> $TARGET_DIR/$BENCH/.gitignore
done

