#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VERSION=1.4.0
echo DIR is $DIR
export DISTDIR="$DIR/../pontus-dist/opt/pontus/pontus-nifi";

CURDIR=`pwd`
cd $DIR
if [[ ! -f ${DIR}/nifi-assembly/target/nifi-${VERSION}-bin.tar.gz ]]; then
MAVEN_OPTS="-Xmx2g -Duser.language=en"   mvn  install -DskipTests=true -e  -T 8
fi

if [[ ! -d $DISTDIR ]]; then
  mkdir -p $DISTDIR
fi
cd $DISTDIR

rm -rf *
tar xvf $DIR/nifi-assembly/target/nifi-${VERSION}-bin.tar.gz

ln -s nifi-${VERSION} current
cd $CURDIR
