MICM Preprocessor
=================

Web service converting JSON representation of chemical mechanism into code to be used by a solver.

[![License](https://img.shields.io/github/license/NCAR/micm-preprocessor.svg)](https://github.com/NCAR/micm-preprocessor/blob/master/LICENSE)

Copyright (C) 2018-2020 National Center for Atmospheric Research

# Run the preprocessor

You will need to have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
and running.
First clone this repository and build the Docker image:

```
git clone https://github.com/NCAR/micm-preprocessor.git
cd micm-preprocessor
docker build -t micm-proc .
```

Then, stage your mechanism configuration files in the `mechanisms/` folder.
As an example, the Chapman chemistry mechanism files are included by default.
Create a folder under `mechanisms/` named with your mechanism name.
Then copy your mechanism JSON files to this folder.
This folder must contain a file named `config.json`, which will be used by the
preprocessor.

You can then run the preprocessor in a Docker container for your mechanism from
the root micm-preprocessor folder (replacing `chapman` with the name you used
for the folder holding your mechanism configuration files):

```
docker run -e MECHANISM_FOLDER=/mechanisms/chapman -it --mount src="$(pwd)/mechanisms",target=/mechanisms,type=bind micm-proc
```

The generated code should now be in `mechanisms/chapman/output/`.

# Local Install
0. Install [node.js](https://nodejs.org "Node Homepage") if it is not on your machine
1. git clone this repository
2. micm-preprocessor> npm install
3. micm-preprocessor> node combined.js &

You may wish to edit combined.js to specify an alternative to port 3000 in the http.listen() at end of combined.js

If you do so, you will need to edit the port number (and potentially the host name) in test/sequence.calls.csh

