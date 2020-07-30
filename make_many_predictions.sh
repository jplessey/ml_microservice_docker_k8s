#!/usr/bin/env bash

ADDRESS=$(minikube service --url microserv-deployment)
echo "Address: $ADDRESS"

# POST method predict
curl -d '{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST $ADDRESS/predict

curl -d '{  
   "CHAS":{  
      "0":3
   },
   "RM":{  
      "0":7.5
   },
   "TAX":{  
      "0":167.0
   },
   "PTRATIO":{  
      "0":9.2
   },
   "B":{  
      "0":245.9
   },
   "LSTAT":{  
      "0":2.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST $ADDRESS/predict

curl -d '{  
   "CHAS":{  
      "0":3
   },
   "RM":{  
      "0":7.5
   },
   "TAX":{  
      "0":167.0
   },
   "PTRATIO":{  
      "0":9.2
   },
   "B":{  
      "0":245.9
   },
   "LSTAT":{  
      "0":2.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST $ADDRESS/predict     