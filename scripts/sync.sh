if [ "$1" = "babel" ]; then
    rsync -av scripts gyeongwk@babel:~/e3
    rsync -av deploy gyeongwk@babel:~/e3
elif [ "$1" = "orchard" ]; then
    gcloud compute scp --tunnel-through-iap --recurse scripts orchard-login-001:~/e3
    gcloud compute scp --tunnel-through-iap --recurse deploy orchard-login-001:~/e3
else
    echo "Usage: $0 [babel|orchard]"
    exit 1
fi
