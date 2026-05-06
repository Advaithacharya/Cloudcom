#Enable Pub/Sub API
gcloud services enable pubsub.googleapis.com

#Create a Pub/Sub Topic
gcloud pubsub topics create my-topic

#Create a Subscription
gcloud pubsub subscriptions create my-subscription --topic=my-topic

#Publish a Message
gcloud pubsub topics publish my-topic --message="Hello, Pub/Sub!"

#Receive Messages
gcloud pubsub subscriptions pull my-subscription --auto-ack

#Terminal 1: Continuous Subscriber (Listening)
gcloud pubsub subscriptions pull my-subscription --auto-ack --limit=10

#Terminal 2: Publisher (Sending Messages)
gcloud pubsub topics publish my-topic --message="Message 1"
gcloud pubsub topics publish my-topic --message="Message 2"

#Clean Up Resources
gcloud pubsub subscriptions delete my-subscription
gcloud pubsub topics delete my-topic
