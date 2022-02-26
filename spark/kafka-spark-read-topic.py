from pyspark.sql import SparkSession
#spark = SparkSession.builder.master('local').appName('pythonSpark').enableHiveSupport().getOrCreate()

# Subscribe to 1 topic
#df = spark.readStream.format("kafka").option("kafka.bootstrap.servers", "broker:30092").option("subscribe", "my-new-topic").load()
#df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")
#df.show()

spark = SparkSession.builder.appName("APP").getOrCreate()

df = spark.readStream.format("kafka").option("kafka.bootstrap.servers", "broker:30092").option("subscribe", "my-new-topic").option("startingOffsets", "earliest").load()

#query = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").writeStream.format("console").option("checkpointLocation", "/test").start()

#query = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").writeStream.format("console").start()

#query = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").writeStream.format("console").option("path","/Users/falmeida").option("checkpointLocation", "/Users/falmeida").start()

query = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)").writeStream.format("kafka").option("kafka.bootstrap.servers", "broker:30092").option("checkpointLocation", "/Users/falmeida/checkpoint").option("topic", "updates").start()

query.awaitTermination()
