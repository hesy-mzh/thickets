BEGIN {
    i=0
}

/[^#]/ {
     a[i]=$1;
     b[i+1]=$4 " " $5;
     i++
}

END {
    for (j=5;j<=NR; j++){
        print a[j],b[j]
    }
}

