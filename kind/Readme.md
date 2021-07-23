## Support Kind with insecure repositories
Kind uses containerd and need to be configured to use insecure repositories to talk to artifactory when running on non https.

```
docker cp insecure-repo-config.toml <cluster>-control-plane:/etc
docker exec -i <cluster>-control-plane bash
$ cat /etc/insecure-repo-config.toml >> /etc/containerd/config.toml
$ service containerd restart
$ crictl info
```
Look for your settings in plugin area for crictl info command.

### Pulling images from insecure registry
Create a secret for registry with credentials

`kubectl create secret docker-registry secreg --docker-server=DOCKER_REGISTRY_SERVER --docker-username=DOCKER_USER --docker-password=DOCKER_PASSWORD`

Use following in kubernetes manifest in spec.template.spec for Deployment. Use imagePullPolicy: Always if your image tag is not changing.
```
conainers:
- name: <container name>
  image: <server>:<port>/<repo>/<image>:<tag>
  imagePullPolicy: Always
imagePullSecrets:
- name: secreg
```
