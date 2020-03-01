#!/usr/bin/env bash

export output=/mapreduce/wordcount/output
echo " ### hadoop folder delete #### ===>  $output"
hadoop fs -rmr $output
spark-submit --master yarn --class org.jacob.SparkWordCount ./target/spark_wordcount-1.0-SNAPSHOT.jar \
                                               /mapreduce/wordcount/input $output \

echo " check the number of lines on $output "
hadoop fs -cat $output/* | wc -l
