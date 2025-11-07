#!/usr/bin/env python3
import json
import pika
import sys

exchangeName = 'mos_exchanges'
exchangeType = 'headers'

count = 0;

# callback
def callback(channel, method, properties, body):
    data = json.loads(body)
    print ("time: %s, tag: %s, value: %s" % (data['time'], data['field'], data['value']))

credentials = pika.PlainCredentials(username='restapi', password='restapi')

connection = pika.BlockingConnection(pika.ConnectionParameters(host='127.0.0.1', port=5672, credentials=credentials))
channel = connection.channel()

channel.exchange_declare(exchange=exchangeName, exchange_type=exchangeType)
result = channel.queue_declare('',exclusive=True)
print("queueName = "+result.method.queue)
queueName = result.method.queue

headers = {}
headers["x-match"] = 'all'
headers["main-app"] = 'mos'
headers["sub-app"] = 'view'

channel.queue_bind(
        exchange=exchangeName,
        queue=queueName,
        arguments=headers)

print("Waiting for messages. To exit press CTRL+C")
channel.basic_consume(queue=queueName, on_message_callback=callback, auto_ack=True)
channel.start_consuming()

