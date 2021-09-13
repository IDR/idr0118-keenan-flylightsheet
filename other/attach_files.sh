#!/bin/bash

for i in `cat files_to_attach.txt`
do
	filename=${i##*/}
	imagename=${filename%_Seg*}
	image=`python /uod/idr/metadata/idr-utils/scripts/annotate/find_images.py $imagename Project:2051`
	python /uod/idr/metadata/idr-utils/scripts/annotate/attach_file.py -m "image/tiff" $i $image
done
