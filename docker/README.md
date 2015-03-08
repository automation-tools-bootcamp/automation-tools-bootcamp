If you do not have Docker installed on your machine, you can `vagrant up` this file and it will give you an Ubuntu 14.04 VM and install Docker on it using Chef.

Then `vagrant ssh` to connect to the VM and you'll have the Dockerfile and sample app available to you in the `/vagrant` folder.

All `docker` commands need to be `sudo docker` when in the VM.

The exposed port needs to be part of your `docker run` command as well, not just be in the `Dockerfile`.

You'll end up with a command that looks like this. `sudo docker run -it --rm -p=3000:3000 --name my-running-app automation-tools-nodejs`

Finally, when on the VM and you do the `docker push` you won't have your Docker credentials set on the VM.  You'll need to set those, and reset them if you `vagrant destroy` the VM.  It is username/password auth and not key based, so it isn't too terrible.