vimuser-mhaig
=============

My additions on top of Dr. Mike's vimfiles:
https://github.com/drmikehenry/vimfiles

Setup
-----

Clone this repository into home directory::

  git clone http://github.com/mhaig/vimuser-mhaig.git ~/.vimuser

Clone jszakmeister's customizations into home directory::

  git clone https://github.com/jszakmeister/vimuser-jszakmeister.git \
  ~/.vimuser-jszakmeister

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
