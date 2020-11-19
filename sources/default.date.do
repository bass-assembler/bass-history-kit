redo-ifchange "$2".repack

tar tvf "$2.repack" | awk '{ print $4 "T" $5 ":00+00:00"}' | sort | tail -1
