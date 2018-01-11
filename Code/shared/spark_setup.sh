/bin/echo 'Welcome in Ziggy, the new generation of Recommender!!'
/bin/echo '
      __
     /oo\
    |    |
^^  (vvvv)   ^^
\\  /\__/\  //
 \\/      \//
  /        \
 |          |    ^
 /          \___/ |
(            )___/
 \----------/
   //    \\
   W      W'

#I keep Spark sleeping until Hadoop is not ready
while [ ! -e /shared/ready.txt ]
do
	sleep 1
done

rm -rf /shared/ready.txt

#then I start the Recommender

/bin/echo 'Ziggy is running the Recommender...'
spark-submit --class com.cloudera.datascience.recommender.RunRecommender /shared/recommender_2.11-0.1.jar 2093760

echo "The end..." >> /shared/end.txt
chmod 777 /shared/end.txt
