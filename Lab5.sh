#Create a file called lambda_function.py (vi lambda_function.py)
def lambda_handler(event, context):
  return {
    "statusCode": 200,
    "body": "Hello from Lambda!"
  }

#Create a Dockerfile (vi Dockerfile)
FROM public.ecr.aws/lambda/python:3.9
COPY lambda_function.py .
CMD ["lambda_function.lambda_handler"]

#You get the IP address. (If you get 3, select the first one; That is the Ip address of the node)
For Example, 192.168.x.x is your Node 1’s internal
IP. (Note it down and use at last step from terminal 2)

#Build the Docker Image
docker build -t my-lambda .

#Run the Container Locally
docker run -p 9000:8080 my-lambda

#Invoke the Function
For Example: If the IP of node 1 is inet 192.168.0.15/24
then the above command will be
curl-XPOST"http://192.168.0.15:9000/2015-03-3/functions/function/invocations" -d '{}'
