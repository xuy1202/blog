
npm install minimatch@"3.0.2"

npm install hexo-cli --save --build-from-source
npm install hexo     --save --build-from-source

hexo init

npm install hexo-generator-index --save
npm install hexo-generator-archive --save
npm install hexo-generator-category --save
npm install hexo-generator-tag --save
npm install hexo-server --save
npm install hexo-deployer-git --save
npm install hexo-deployer-heroku --save
npm install hexo-deployer-rsync --save
npm install hexo-deployer-openshift --save
npm install hexo-renderer-marked@0.2 --save
npm install hexo-renderer-stylus@0.2 --save
npm install hexo-generator-feed@1 --save
npm install hexo-generator-sitemap@1 --save
npm install hexo-util --save
npm install hexo-generator-searchdb --save

git clone https://github.com/iissnan/hexo-theme-next themes/next

cd themes/next
npm install bower --save
npm install grunt-cli --save
cd -

