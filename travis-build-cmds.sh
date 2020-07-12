#!/bin/bash

#docker run --name travis-debug -dit travisci/ci-garnet:packer-1512502276-986baf0 /sbin/init
#docker exec -it travis-debug bash -l

# in docker container
su - travis
cd builds/

# clone and setup travis-build
git clone https://github.com/travis-ci/travis-build
cd travis-build
mkdir -p ~/.travis
ln -s $PWD ~/.travis/travis-build
gem install bundler
bundle install --gemfile ~/.travis/travis-build/Gemfile
bundler binstubs travis
cd ..
git clone --depth=50 https://github.com/manid2/lone-wolf-theme.git manid2/lone-wolf-theme
cd manid2/lone-wolf-theme
~/.travis/travis-build/bin/travis compile > ci.sh
sed -i 's,--branch\\=\\\x27\\\x27,--branch\\=master,g' ci.sh
bash ci.sh
