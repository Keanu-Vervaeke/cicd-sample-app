#!/bin/bash
set -euo pipefail

rm -rf tempdir

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp cicd-sample-app/sample_app.py tempdir/.
cp -r cicd-sample-app/templates/* tempdir/templates/.
cp -r cicd-sample-app/static/* tempdir/static/.

cat > tempdir/Dockerfile << _EOF_
FROM python
RUN pip install flask
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
COPY  sample_app.py /home/myapp/
EXPOSE 5050
CMD python /home/myapp/sample_app.py
_EOF_

cd tempdir || exit
docker build -t sampleapp .
docker run -t -d -p 5050:5050 --name samplerunning sampleapp
docker ps -a 
