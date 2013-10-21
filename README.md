vimrc
=====

My personal vimrc

Used:

  [jslint.vim](https://github.com/hallettj/jslint.vim.git)

  ```
  jslint.vim$ rake
  Updating local repo...
  Already up-to-date.
  Installed ftplugin/javascript/jslint.vim to /home/rob/.vim/ftplugin/javascript/
  Installed ftplugin/javascript/jslint/jslint-core.js to /home/rob/.vim/ftplugin/javascript/jslint/
  Installed ftplugin/javascript/jslint/runjslint.js to /home/rob/.vim/ftplugin/javascript/jslint/
  Installed ftplugin/javascript/jslint/runjslint.wsf to /home/rob/.vim/ftplugin/javascript/jslint/
  Update of vim script complete.
  ```

  [Pathogen](https://github.com/tpope/pathogen)
  ```
  mkdir -p ~/.vim/autoload ~/.vim/bundle; \
  curl -Sso ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  ```

  [typescript.vim](https://github.com/leafgarland/typescript-vim.git)
  ```
  cd ~/.vim/bundle
  git clone https://github.com/leafgarland/typescript-vim.git
  ```

  [vim-javascript](https://github.com/pangloss/vim-javascript)
  ```
  npm i jslint -g
  cd ~/.vim/bundle
  git clone https://github.com/pangloss/vim-javascript.git
  ```
