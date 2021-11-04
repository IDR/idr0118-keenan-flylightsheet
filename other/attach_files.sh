#!/bin/bash

projectId=$1

for i in `cat files_to_attach.txt`
do
	filename=${i##*/}
	imagename=${filename%_*}
	if [[ $imagename == *Segmented ]]
	then
		imagename=${imagename%_Segmented*}
	fi
	if [[ $filename == *tif ]]
	then
		mtype="image/tiff"
	else
		mtype="openmicroscopy.org/idr/analysis/original"
	fi
	image=`python /uod/idr/metadata/idr-utils/scripts/annotate/find_images.py $imagename Project:$projectId`
	python /uod/idr/metadata/idr-utils/scripts/annotate/attach_file.py -m $mtype $i $image
done
