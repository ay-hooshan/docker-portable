# Using Docker *Portable*

## How to use?

1. `docker` should be installed on machine.
2. edit docker config files (`/etc/docker/daemon.json`) in host machine and client machine:
    ```json
    {
        "experimental": false,
        "insecure-registries": ["localhost:5000"]
    }
    ```
4. run in terminal:
    ```bash
    sudo chmod u+x run.sh
    ./run.sh
    ```
5. go to `http://localhost:5000/v2/_catalog` to see available images.
6. how to pull image:
    ```bash
    sudo docker pull localhost:5000/<image-name>
    ```
7. it's done!

> instead of `localhost` you should consider your ip in private network.
> ***you should restart your docker after new configs***.


## Docs

- pull registry image from `Dockerub`
    ```bash
    sudo docker pull registry
    ```
    
- store pulled images on your machine in file for transfering
    ```bash
    docker save -o <save-location>/<file-name>.tar <image-name>
    ```

- load image from file to machine
    ```bash
    docker load -i <image-file-path>.tar
    ```

- run image to specific volume (for read and write)
    ```bash
    sudo docker run --rm -v ./regvol:/var/lib/registry --name hooshan-registry -p 5000:5000 registry
    ```

- add image to registry:
    ```bash
    sudo docker tag <image-name> <your-registry-address>/<image-name>
    sudo docker push <your-registry-address>/<image-name>
    ```

- remove all docker images:
    ```bash
    sudo docker rmi -f $(sudo docker images -aq)
    ```

- remove all docker containers:
    ```bash
    sudo docker rm -vf $(sudo docker ps -aq)
    ```
    ```
    sudo docker container prune 
    ```
