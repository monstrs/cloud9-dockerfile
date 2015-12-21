Cloud9 Dockerfile
=============

Docker image for Cloud9 IDE

## Usage

    docker run -d -p 80:80 -v $(pwd):/workspace monstrs/cloud9 -a login:password
