7z l "$2.7z" | tail -1 | cut -d" " -f1-2 | tr " " T |sed 's/$/+00:00/'
