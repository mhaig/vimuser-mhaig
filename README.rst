vimuser-mhaig
=============

My additions on top of Dr. Mike's vimfiles:
https://github.com/drmikehenry/vimfiles

Setup
-----

This configuration builds on top of Dr. Mike's vimfiles configuration.  To setup
everything, you need to first clone Dr. Mike's configuration to `~/.vim` and run
the `setup.py` file::

    git clone https://github.com/drmikehenry/vimfiles.git ~/.vim
    cd ~/.vim
    python setup.py

then clone this repository into `~/.vimuser`::

  git clone https://github.com/mhaig/vimuser-mhaig.git ~/.vimuser

Windows with Subversion
^^^^^^^^^^^^^^^^^^^^^^^

Since I have now had to do this a few times I should probably document it...

Start a command shell and verify that the current directory is the
``USERPROFILE`` directory with ``set USERPROFILE``.  Change the working
directory if necessary.

* Once set in the correct directory, get **vimfiles** from Dr. Mike's repository
  with Subversion::

    svn co https://github.com/drmikehenry/vimfiles.git/trunk vimfiles

  and setup::

    copy vimfiles\home.vimrc _vimrc

* Next grab this repository::

    svn co https://github.com/mhaig/vimuser-mhaig.git/trunk _vimuser

* Finally, grab jszakmeister's customizations::

    svn co https://github.com/jszakmeister/vimuser-jszakmeister.git/trunk \
    _vimrc-jszakmeister

Enjoy!
