# eventstream
eventstream app

## GCP Default Docker Container
```
gcloud compute instances create-with-container instance-20240227-002215 --project=cuda-old --zone=us-central1-a --machine-type=e2-medium --network-interface=address=34.69.213.211,network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=196717963363-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --image=projects/cos-cloud/global/images/cos-stable-109-17800-147-15 --boot-disk-size=10GB --boot-disk-type=pd-balanced --boot-disk-device-name=instance-20240227-002215 --container-image=obrienlabs/magellan-nbi:0.0.3-ia64 --container-restart-policy=always --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud,container-vm=cos-stable-109-17800-147-15

Just need to expose the ports
michael@instance-20240227-002215 ~ $ docker ps -a
CONTAINER ID   IMAGE                                COMMAND                  CREATED             STATUS             PORTS     NAMES
d56ed6dbcdde   obrienlabs/magellan-nbi:0.0.3-ia64   "java -Djava.securit…"   About an hour ago   Up About an hour             klt-instance-20240227-002215-mdvq
michael@instance-20240227-002215 ~ $ docker exec -it d56ed6dbcdde bash
root@instance-20240227-002215:/# curl http://127.0.0.1:8080/nbi/api
{"id":1,"content":"PASS remoteAddr: 127.0.0.1 localAddr: 127.0.0.1 remoteHost: 127.0.0.1 serverName: 127.0.0.1"}root@instance-20240227-002215:/# 


