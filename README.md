<img src="https://circleci.com/gh/jplessey/ml_microservice_docker_k8s.svg?style=svg" alt="jplessey">

# Udacity Cloud DevOps Nanodregree 2020
## Project 4: Operationalize a Machine Learning Microservice API

### Summary

We were given a pre-trained, sklearn model that was trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on the data <a href="https://www.kaggle.com/c/boston-housing">source site.</a>
The idea of the project was to test our abilities to operationalize a Python flask app — in a provided file, `app.py` — that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling. (Source: Udacity Project Description)

### Project Tasks

* Test the project code using linting
* Complete a Dockerfile to containerize this application
* Deploy the containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

### Extended Tasks

To take the project further, I added the following tasks:
* Create a Kubernetes Deployment and add a Service to it.
* Create a Horizontal Pod Autoscaler (HPA) associated with the Deployment.
* Test the autoscaling implementation under a heavy load of API calls.

### Running the containerized App

(Docker required)
1. Type `./run_docker.sh` in a terminal. This will build the Docker image for the app, and launch a container listening in port 8000
2. Type `./make_prediction.sh` in a second terminal window. This will make an API call to produce a prediction

### Running the App with Kubernetes

(Minikube and Kubectl required)
1. Type `minikube start` in a terminal to start a local cluster
2. Type `./run_kubernetes.sh` to create a pod and run the containerized App listening in port 8000
3. Check the pod's status with a call to `kubectl get pod`
4. Once your pod is `Running`, make an API call in a second Terminal window typing `./make_prediction.sh` 

### Autoscaling the App with Kubernetes and HPA

Once a cluster ha been started (you can use the same from the instructions above):
1. Type `./run_deployment.sh` which will do several things: 
    * Create a Deployment with one (1) initial pod.
    * Create a Service associated with the deployment. This will make the App listen from a new URL to be able to scale.
    * Enable metrics-server addon in Minikube. This will provide the necesary metrics to make the App scale.     
2. Again, check the new pod's status with a call to `kubectl get pod`
3. Create the HPA by typing:
   `kubectl autoscale deployment microserv-deployment --cpu-percent=40 --min=1 --max=5`
