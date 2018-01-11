/bin/echo 'Adding dataset to Hadoop...'

#Adding Hadoop to PATH
PATH="$PATH:/usr/local/hadoop/bin"
hdfs dfsadmin -safemode leave

#Adding dataset to Hadoop checking that it doesn't exists yet

hadoop fs -test -e /user/ds
if [ $? != 0 ]
then
	/bin/echo 'Creating directory...'
	hadoop fs -mkdir /user/ds
fi

hadoop fs -test -e /user/ds/user_artist_data.txt
if [ $? != 0 ]
then
	/bin/echo 'Adding user_artist_data.txt...'
	hadoop fs -put /shared/user_artist_data.txt /user/ds/user_artist_data.txt
fi

hadoop fs -test -e /user/ds/artist_data_filtered.txt
if [ $? != 0 ]
then
	/bin/echo 'Adding artist_data.txt...'
	hadoop fs -put /shared/artist_data_filtered.txt /user/ds/artist_data_filtered.txt
fi

hadoop fs -test -e /user/ds/artist_alias.txt
if [ $? != 0 ]
then
	/bin/echo 'Adding artist_alias.txt...'
	hadoop fs -put /shared/artist_alias.txt /user/ds/artist_alias.txt
fi

echo "I'm ready" >> /shared/ready.txt
chmod 777 /shared/ready.txt

# /bin/echo 'Cosa cè nella cartella???'
# hadoop fs -ls hdfs://hadoop:9000/user/ds/

while [ ! -e /shared/end.txt ]
do
	sleep 2
done

rm -rf /shared/end.txt
